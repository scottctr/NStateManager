#region Copyright (c) 2018 Scott L. Carter
//
//Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in
//compliance with the License. You may obtain a copy of the License at
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software distributed under the License is 
//distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and limitations under the License.
#endregion

using System;
using System.Threading.Tasks;
using NStateManager.Sync;
using NStateManager.Tests.Async;
using Xunit;

namespace NStateManager.Tests.Sync
{
    public class StateMachineTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateAccessor_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: null
                , stateMutator: (sale, newState) => sale.State = newState));
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateMutator_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: null));
        }

        [Fact]
        public void AddTriggerAction_throws_InvalidOperationException_if_action_already_added_for_trigger()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            //1st one works fine
            sut.AddTriggerAction(SaleEvent.AddItem, sale => Task.Delay(millisecondsDelay: 1));

            //Adding the same thing 2nd time throws exception
            Assert.Throws<InvalidOperationException>(() =>
                sut.AddTriggerAction(SaleEvent.AddItem, sale => Task.Delay(millisecondsDelay: 1)));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_InvalidOperationException_if_action_already_added_for_trigger()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            //1st one works fine
            sut.AddTriggerAction<string>(SaleEvent.AddItem, (sale, stringParam) => Task.Delay(millisecondsDelay: 1));

            //Adding the same thing 2nd time throws exception
            Assert.Throws<InvalidOperationException>(() =>
                sut.AddTriggerAction<string>(SaleEvent.AddItem
                    , (sale, stringParam) => Task.Delay(millisecondsDelay: 1)));
        }

        [Fact]
        public void ConfigureState_returns_existing_state_if_already_added()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var firstState = sut.ConfigureState(SaleState.Complete);
            var secondState = sut.ConfigureState(SaleState.Complete);

            Assert.Same(firstState, secondState);
        }

        [Fact]
        public void FireTrigger_executes_trigger_event_when_defined()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var triggerActionExecuted = false;
            sut.AddTriggerAction(SaleEvent.AddItem, sale => triggerActionExecuted = true);

            sut.FireTrigger(new Sale(saleId: 45), SaleEvent.AddItem);

            Assert.True(triggerActionExecuted);
        }

        [Fact]
        public void FireTrigger_sends_parameters_to_configured_state()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete);

            var result = sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }

        [Fact]
        public void FireTrigger_does_not_require_configured_state()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var result = sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Open, sale.State);
            Assert.False(result.WasTransitioned);
        }

        [Fact]
        public void FireTrigger_executes_exitAction()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var exitActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete)
               .AddExitAction(sale1 => exitActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(exitActionFired);
        }

        [Fact]
        public void FireTrigger_does_not_execute_exitAction_when_moving_to_substate()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var exitActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete)
               .AddExitAction(sale1 => exitActionFired = true);
            sut.ConfigureState(SaleState.Complete)
               .MakeSubstateOf(sut.ConfigureState(SaleState.Open))
               .AddExitAction(sale1 => exitActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.False(exitActionFired);
        }

        [Fact]
        public void FireTrigger_executes_entryAction()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var entryActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete);

            sut.ConfigureState(SaleState.Complete)
               .AddEntryAction(sale1 => entryActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(entryActionFired);
        }

        [Fact]
        public void FireTrigger_does_not_execute_entryAction_when_changing_to_superState()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.ChangeDue };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var entryActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddEntryAction(sale1 => entryActionFired = true);
            sut.ConfigureState(SaleState.ChangeDue)
               .MakeSubstateOf(sut.ConfigureState(SaleState.Open))
               .AddTransition(SaleEvent.Pay, SaleState.Open);

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.False(entryActionFired);
        }

        [Fact]
        public void FireTrigger_executes_autoTransition()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, sale1 => true, name: "toComplete");

            var result = sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public void FireTrigger_executes_entryExitActions_for_autoTransition()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, sale1 => true, name: "toComplete");

            var completeEntryActionFired = false;
            sut.ConfigureState(SaleState.Complete)
                .AddEntryAction(sale1 => completeEntryActionFired = true);

            var result = sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(completeEntryActionFired);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public void FireTrigger_executes_reentryActions_if_no_state_change()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var reentryActionFired = false;
            sut.ConfigureState(SaleState.Open)
                .AddReentryAction(sale1 => reentryActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(reentryActionFired);
        }

        [Fact]
        public void FireTrigger_fires_notification_when_no_trigger_defined()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);
            var noTriggerEventFired = false;
            sut.OnTriggerNotConfigured += (sender, args) => { noTriggerEventFired = true; };

            sut.ConfigureState(SaleState.ChangeDue)
               .AddTransition(SaleEvent.AddItem, SaleState.Complete, _ => false);

            sut.FireTrigger(new Sale(55) { State = SaleState.Open } , SaleEvent.AddItem);

            Assert.True(noTriggerEventFired);
        }

        [Fact]
        public void FireTrigger_fires_notification_when_no_transition()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);
            var noTransitionEventFired = false;
            sut.OnNoTransition += (sender, args) => { noTransitionEventFired = true; };
            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.AddItem, SaleState.Complete, _ => false);

            sut.FireTrigger(new Sale(saleId: 55) { State = SaleState.Open }, SaleEvent.AddItem);

            Assert.True(noTransitionEventFired);
        }

        [Fact]
        public void FireTriggerWRequest_executes_trigger_event_when_defined()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState);

            var triggerActionExecuted = false;
            sut.AddTriggerAction(SaleEvent.AddItem, sale => triggerActionExecuted = true);

            sut.FireTrigger(new Sale(saleId: 45), SaleEvent.AddItem, "stringParam");

            Assert.True(triggerActionExecuted);
        }

        [Fact]
        public void FireTriggerWRequest_sends_parameters_to_configured_state()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete);

            var result = sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }

        [Fact]
        public void FireTriggerWRequest_does_not_require_configured_state()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var result = sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Open, sale.State);
            Assert.False(result.WasTransitioned);
        }

        [Fact]
        public void FireTriggerWRequest_executes_exitAction()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var exitActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete)
               .AddExitAction(sale1 => exitActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.True(exitActionFired);
        }

        [Fact]
        public void FireTriggerWRequest_executes_entryAction()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            var entryActionFired = false;

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete);

            sut.ConfigureState(SaleState.Complete)
               .AddEntryAction(sale1 => entryActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.True(entryActionFired);
        }

        [Fact]
        public void FireTriggerWRequest_executes_autoTransition()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, _=> true, name: "toComplete");

            var result = sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public void FireTriggerWRequest_executes_entryExitActions_for_autoTransition()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, name: "toChangeDue");

            sut.ConfigureState(SaleState.ChangeDue)
               .AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, sale1 => true, name: "toComplete");

            var completeEntryActionFired = false;
            sut.ConfigureState(SaleState.Complete)
                .AddEntryAction(sale1 => completeEntryActionFired = true);

            var result = sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.True(completeEntryActionFired);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal("toComplete", result.LastTransitionName);
        }

        [Fact]
        public void FireTriggerWRequest_executes_reentryActions_if_no_state_change()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            var reentryActionFired = false;
            sut.ConfigureState(SaleState.Open)
                .AddReentryAction(sale1 => reentryActionFired = true);

            sut.FireTrigger(sale, SaleEvent.Pay, "stringParam");

            Assert.True(reentryActionFired);
        }

        [Fact]
        public void IsInState_determines_if_context_in_specified_state()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);

            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete);

            Assert.True(sut.IsInState(sale, SaleState.Open));
            Assert.False(sut.IsInState(sale, SaleState.ChangeDue));
            Assert.False(sut.IsInState(sale, SaleState.Complete));

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(sut.IsInState(sale, SaleState.Complete));
            Assert.False(sut.IsInState(sale, SaleState.Open));
            Assert.False(sut.IsInState(sale, SaleState.ChangeDue));
        }

        [Fact]
        public void OnTransitionEvent_registers_action_when_state_changes()
        {
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
            sut.ConfigureState(SaleState.Open).AddTransition(SaleEvent.Pay, SaleState.Complete);
            var transitionEventFired = false;
            sut.OnTransition += (sender, _) => transitionEventFired = true;

            sut.FireTrigger(sale, SaleEvent.Pay);

            Assert.True(transitionEventFired);
        }

        [Fact]
        public void FireTriggerWRequest_addTransitionSignatureWRequest_transitionExecutesWithRequestInstance()
        {
            var testRequest = new Request(value: 123.45);

            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
                , stateMutator: (sale3, newState) => sale3.State = newState);

            var result = default(double);

            sut.ConfigureState(SaleState.Open)
                .AddTransition<Request>(SaleEvent.Pay, SaleState.Complete, (saleInstance, request) =>
                {
                    result = request.Value;
                    return true;
                });

            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            var stateTransitionResult = sut.FireTrigger(sale, SaleEvent.Pay, testRequest);

            Assert.NotNull(stateTransitionResult);
            Assert.Equal(SaleState.Complete, stateTransitionResult.CurrentState);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(result, testRequest.Value);
        }

        [Fact]
        public void FireTriggerWRequest_addConsecutiveTransitionSignaturesWRequest_transitionExecutesWithRequestInstance()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
                , stateMutator: (sale3, newState) => sale3.State = newState);

            var result1 = default(double);
            var result2 = default(double);
            var testRequest1 = new Request(123.45);
            var testRequest2 = new Request(12);

            sut.ConfigureState(SaleState.Open)
                .AddTransition<Request>(SaleEvent.Pay, SaleState.ChangeDue, (saleInstance, request) =>
                {
                    result1 = request.Value;
                    return true;
                });

            sut.ConfigureState(SaleState.ChangeDue)
                .AddTransition<Request>(SaleEvent.ChangeGiven, SaleState.Complete, (saleInstance, request) =>
                {
                    result2 = request.Value;
                    return true;
                });
            var sale = new Sale(saleId: 45) { State = SaleState.Open };
            sut.FireTrigger(sale, SaleEvent.Pay, testRequest1);
            var stateTransitionResult = sut.FireTrigger(sale, SaleEvent.ChangeGiven, testRequest2);

            Assert.NotNull(stateTransitionResult);
            Assert.Equal(SaleState.Complete, stateTransitionResult.CurrentState);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(result1, testRequest1.Value);
            Assert.Equal(result2, testRequest2.Value);
        }
    }
}