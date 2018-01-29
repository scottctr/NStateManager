using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class StateMachineAsyncTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateAccessor_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: null
                , stateMutator: (sale, newState) => sale.State = newState));
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateMutator_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: null));
        }

        [Fact]
        public void AddTriggerAction_throws_InvalidOperationException_if_action_already_added_for_trigger()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            //1st one works fine
            sut.AddTriggerAction(SaleEvent.AddItem, (sale, _) => Task.Delay(millisecondsDelay: 1));

            //Adding the same thing 2nd time throws exception
            Assert.Throws<InvalidOperationException>(() =>
                sut.AddTriggerAction(SaleEvent.AddItem, (sale, _) => Task.Delay(millisecondsDelay: 1)));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_InvalidOperationException_if_action_already_added_for_trigger()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            //1st one works fine
            sut.AddTriggerAction<string>(SaleEvent.AddItem, (sale, stringParam, _) => Task.Delay(millisecondsDelay: 1));

            //Adding the same thing 2nd time throws exception
            Assert.Throws<InvalidOperationException>(() =>
                sut.AddTriggerAction<string>(SaleEvent.AddItem
                    , (sale, stringParam, _) => Task.Delay(millisecondsDelay: 1)));
        }

        [Fact]
        public void ConfigureState_returns_existing_state_if_already_added()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var firstState = sut.ConfigureState(SaleState.Complete);
            var secondState = sut.ConfigureState(SaleState.Complete);

            Assert.Same(firstState, secondState);
        }

        [Fact]
        public async Task FireTriggerAsync_executes_trigger_event_when_defined()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var triggerActionExecuted = false;
            sut.AddTriggerAction(SaleEvent.AddItem, (sale, _) => Task.Run(() => triggerActionExecuted = true));

            await sut.FireTriggerAsync(new Sale(saleID: 45), SaleEvent.AddItem, default(CancellationToken));

            Assert.True(triggerActionExecuted);
        }

        [Fact]
        public async Task FireTriggerAsync_can_cancel_trigger_event()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);
            sut.AddTriggerAction(SaleEvent.AddItem, (_, cancelToken) =>
            {
                Task.Delay(millisecondsDelay: 999999, cancellationToken: cancelToken).Wait();
                return Task.CompletedTask;
            });

            var wasCancelled = false;
            using (var cancelSource = new CancellationTokenSource())
            {
                try
                {
                    cancelSource.Cancel(throwOnFirstException: true);
                    await Task.Run(async () => await sut.FireTriggerAsync(new Sale(saleID: 45), SaleEvent.AddItem, cancelSource.Token));

                    cancelSource.Cancel(throwOnFirstException: true);
                }
                catch (AggregateException ex)
                {
                    wasCancelled = ex.InnerExceptions.OfType<OperationCanceledException>().Any();
                }
            }

            Assert.True(wasCancelled);
        }

        [Fact]
        public async Task FireTriggerAsnync_sends_parameters_to_configured_state()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }

        [Fact]
        public async Task FireTriggerAsnync_doesnt_require_configured_state()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Open, sale.State);
            Assert.False(result.WasSuccessful);
        }

        [Fact]
        public async Task FireTriggerAsnync_executes_exitAction()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var exitActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null)
               .AddExitAction((sale1, _) => { exitActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(exitActionFired);
        }

        [Fact]
        public async Task FireTriggerAsnync_executes_entryAction()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var entryActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);

            sut.ConfigureState(SaleState.Complete)
               .AddEntryAction((sale1, _) => { entryActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(entryActionFired);
        }

        [Fact]
        public async Task FireTriggerAsnync_executes_autoTransition()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, conditionAsync: null, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoTransition(SaleState.Complete, (sale1, _) => Task.FromResult(result: true), name: "toComplete");

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public async Task FireTriggerAsnync_executes_entryExitActions_for_autoTransition()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, conditionAsync: null, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoTransition(SaleState.Complete, (sale1, _) => Task.FromResult(result: true), name: "toComplete");

            var completeEntryActionFired = false;
            sut.ConfigureState(SaleState.Complete)
                .AddEntryAction((sale1, _) => { completeEntryActionFired = true; return Task.CompletedTask; } );

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(completeEntryActionFired);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public async Task FireTriggerAsnync_executes_reentryActions_if_no_state_change()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var reentryActionFired = false;
            sut.ConfigureState(SaleState.Open)
                .AddReentryAction((sale1, _) => { reentryActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(reentryActionFired);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_trigger_event_when_defined()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var triggerActionExecuted = false;
            sut.AddTriggerAction(SaleEvent.AddItem, (sale, _) => Task.Run(() => triggerActionExecuted = true));

            await sut.FireTriggerAsync(new Sale(saleID: 45), SaleEvent.AddItem, "stringParam", default(CancellationToken));

            Assert.True(triggerActionExecuted);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_can_cancel_trigger_event()
        {
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);
            sut.AddTriggerAction(SaleEvent.AddItem, (_, cancelToken) =>
            {
                Task.Delay(millisecondsDelay: 999999, cancellationToken: cancelToken).Wait();
                return Task.CompletedTask;
            });

            var wasCancelled = false;
            using (var cancelSource = new CancellationTokenSource())
            {
                try
                {
                    cancelSource.Cancel(throwOnFirstException: true);
                    await Task.Run(async () => await sut.FireTriggerAsync(new Sale(saleID: 45), SaleEvent.AddItem, "stringParam", cancelSource.Token));

                    cancelSource.Cancel(throwOnFirstException: true);
                }
                catch (AggregateException ex)
                {
                    wasCancelled = ex.InnerExceptions.OfType<OperationCanceledException>().Any();
                }
            }

            Assert.True(wasCancelled);
        }

        [Fact]
        public async Task FireTriggerAsnyncWRequest_sends_parameters_to_configured_state()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_doesnt_require_configured_state()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Open, sale.State);
            Assert.False(result.WasSuccessful);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_exitAction()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var exitActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null)
               .AddExitAction((sale1, _) => { exitActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.True(exitActionFired);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_entryAction()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var entryActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);

            sut.ConfigureState(SaleState.Complete)
               .AddEntryAction((sale1, _) => { entryActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.True(entryActionFired);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_autoTransition()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, conditionAsync: null, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoTransition(SaleState.Complete, (sale1, _) => Task.FromResult(result: true), name: "toComplete");

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_entryExitActions_for_autoTransition()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, conditionAsync: null, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoTransition(SaleState.Complete, (sale1, _) => Task.FromResult(result: true), name: "toComplete");

            var completeEntryActionFired = false;
            sut.ConfigureState(SaleState.Complete)
                .AddEntryAction((sale1, _) => { completeEntryActionFired = true; return Task.CompletedTask; });

            var result = await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.True(completeEntryActionFired);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public async Task FireTriggerAsyncWRequest_executes_reentryActions_if_no_state_change()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var reentryActionFired = false;
            sut.ConfigureState(SaleState.Open)
                .AddReentryAction((sale1, _) => { reentryActionFired = true; return Task.CompletedTask; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay, "stringParam");

            Assert.True(reentryActionFired);
        }

        [Fact]
        public async Task IsInState_determins_if_context_in_specified_state()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);

            Assert.True(sut.IsInState(sale, SaleState.Open));
            Assert.False(sut.IsInState(sale, SaleState.ChangeDue));
            Assert.False(sut.IsInState(sale, SaleState.Complete));

            await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(sut.IsInState(sale, SaleState.Complete));
            Assert.False(sut.IsInState(sale, SaleState.Open));
            Assert.False(sut.IsInState(sale, SaleState.ChangeDue));
        }

        [Fact]
        public async Task RegisterOnTransitionedEvent_registers_action_when_state_changes()
        {
            var sale = new Sale(saleID: 45) { State = SaleState.Open };
            var sut = new StateMachineAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete, conditionAsync: null);
            var transitionEventFired = false;
            sut.RegisterOnTransitionedEvent((sale1, result) => { transitionEventFired = true; });

            await sut.FireTriggerAsync(sale, SaleEvent.Pay);

            Assert.True(transitionEventFired);
        }
    }
}