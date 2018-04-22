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
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class StateConfigurationAsyncTests
    {
        [Fact]
        public void AddAutoForwardDynamicTransition_add_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardDynamicTransition(SaleEvent.Pay, sale => SaleState.Complete);

            Assert.Single(sut.AutoTransitions);
        }

        [Fact]
        public void AddAutoForwardDynamicTransitionWRequest_add_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardDynamicTransition<string>(SaleEvent.Pay, (sale, stringParam) => SaleState.Complete);

            Assert.Single(sut.AutoTransitions);
        }


        [Fact]
        public void AddAutoForwardTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, (sale, _) => Task.FromResult(result: true));

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, (sale, _) => Task.FromResult(result: true)));
        }

        [Fact]
        public void AddAutoForwardTransition_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddAutoForwardTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam, _) => Task.FromResult(result: true));

            Assert.Throws<InvalidOperationException>(() 
                => sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam, _) => Task.FromResult(result: true)));
        }

        [Fact]
        public void AddAutoForwardTransitionWRequest_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddDynamicTransition_throws_ArgumentNullException_if_Function_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition(SaleEvent.AddItem, stateFunction: null));
        }

        [Fact]
        public void AddDynamicTransition_adds_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddDynamicTransition(SaleEvent.AddItem, stateFunction: sale => SaleState.Complete);

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddDynamicTransitionWRequest_adds_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddDynamicTransition<string>(SaleEvent.AddItem, stateFunction: (sale, request) => SaleState.Complete);

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddDynamicTransitionWRequest_throws_ArgumentNullException_if_Function_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition<string>(SaleEvent.AddItem, stateFunction: null));
        }

        [Fact]
        public void AddEntryAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null));
        }

        [Fact]
        public void AddEntryAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddEntryAction((sale, _) => Task.CompletedTask);

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction((sale, _) => Task.CompletedTask));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddEntryAction((sale, _) => Task.CompletedTask, previousState: SaleState.Open);

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction((sale, _) => Task.CompletedTask, SaleState.Open));
        }

        [Fact]
        public void AddExitAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddExitAction(action: null));
        }

        [Fact]
        public void AddExitAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddExitAction((sale, _) => Task.CompletedTask);

            Assert.Throws<InvalidOperationException>(() => sut.AddExitAction((sale, _) => Task.CompletedTask));
        }

        [Fact]
        public void AddExitActionWNextState_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddExitAction(action: null, nextState: SaleState.ChangeDue));
        }

        [Fact]
        public void AddExitActionWNextState_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddExitAction((sale, _) => Task.CompletedTask, SaleState.Complete);

            Assert.Throws<InvalidOperationException>(() => sut.AddExitAction((sale, _) => Task.CompletedTask, SaleState.Complete));
        }

        [Fact]
        public void AddAutoFallbackTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.ChangeDue, (sale, _) => Task.FromResult(result: true));

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.ChangeDue, (sale, _) => Task.FromResult(result: true)));
        }

        [Fact]
        public void AddAutoFallbackTransition_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.ChangeDue, condition: null));
        }

        [Fact]
        public void AddAutoFallbackTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.ChangeDue, (sale, stringParam, _) => Task.FromResult(result: true));

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.ChangeDue, (sale, stringParam, _) 
                => Task.FromResult(result: true)));
        }

        [Fact]
        public void AddAutoFallbackTransitionWRequest_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.ChangeDue, condition: null));
        }

        [Fact]
        public void AddAutoFallbackTransitionWRequest_adds_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.ChangeDue, condition: (sale, s, _) => Task.FromResult(true));

            Assert.Single(
                (stateMachine.ConfigureState(SaleState.ChangeDue) as StateConfigurationAsync<Sale, SaleState, SaleEvent>)
               .AutoTransitions);
        }

        [Fact]
        public void AddReentryAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddReentryAction(action: null));
        }

        [Fact]
        public void AddReentryAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddReentryAction((sale, _) => Task.CompletedTask);

            Assert.Throws<InvalidOperationException>(() => sut.AddReentryAction((sale, _) => Task.CompletedTask));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_configuredState_already_substate()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            //First time works fine
            sut.AddSuperState(openStateConfig);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => sut.AddSuperState(openStateConfig));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_configuredState_already_superState()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var changeDueConfig = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            changeDueConfig.AddSuperState(openStateConfig);

            Assert.Throws<ArgumentOutOfRangeException>(() => openStateConfig.AddSuperState(changeDueConfig));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_substate_is_already_superstate()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            //First time works fine
            openStateConfig.AddSuperState(sut);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => openStateConfig.AddSuperState(sut));
        }

        [Fact]
        public void AddTransitionWRequest_add_transition()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTransition<string>(SaleEvent.AddItem, SaleState.Complete, (sale, stringParam, cancelToken) => Task.FromResult(true));

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddTransitionWRequest_throws_ArgumentNullException_if_ConditionAsync_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTransition<string>(SaleEvent.AddItem, SaleState.Complete, conditionAsync: null));
        }

        [Fact]
        public void AddTriggerAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTriggerAction(SaleEvent.Pay, (sale, _) => Task.CompletedTask);

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction(SaleEvent.Pay, (sale, _) => Task.CompletedTask));
        }

        [Fact]
        public void AddTriggerAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam, _) => Task.CompletedTask);

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam, _) => Task.CompletedTask));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction<string>(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public async Task ExecuteAutoTransitionAsync_executes_AutoTransition_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.ChangeDue
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            sut.AddAutoForwardTransition(SaleEvent.ChangeGiven, SaleState.Complete, (sale1, _) => Task.FromResult(result: true));
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = await sut.ExecuteAutoTransitionAsync(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public async Task ExecuteAutoTransitionAsync_executes_AutoTransition_for_superState()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            IStateConfigurationAsyncInternal<Sale, SaleState, SaleEvent> openState = stateMachine.ConfigureState(SaleState.Open) as IStateConfigurationAsyncInternal<Sale, SaleState, SaleEvent>;
            IStateConfigurationAsyncInternal<Sale, SaleState, SaleEvent> changeDueState = stateMachine.ConfigureState(SaleState.ChangeDue) as IStateConfigurationAsyncInternal<Sale, SaleState, SaleEvent>;
            changeDueState.AddSuperState(openState);
            openState.AddAutoForwardTransition(SaleEvent.ChangeGiven, SaleState.Complete, (sale1, _) => Task.FromResult(result: true));
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = await changeDueState.ExecuteAutoTransitionAsync(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public void ExecuteAutoTransitionAsync_can_be_cancelled()
        {
            var stopwatch = new Stopwatch();
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.ChangeDue
                , SaleState.ChangeDue
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            sut.AddAutoForwardTransition(SaleEvent.ChangeGiven, SaleState.Complete, (sale1, cancelToken) =>
            {
                Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] starting AutoForward condition");
                do
                {
                    Task.Delay(millisecondsDelay: 99).Wait();
                } while (!cancelToken.IsCancellationRequested);

                Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] completed AutoForward condition - {cancelToken.IsCancellationRequested}");

                return Task.FromResult(result: !cancelToken.IsCancellationRequested);
            });

            using (var mutex = new Mutex(initiallyOwned: false))
            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale, cancelSource.Token);
                StateTransitionResult<SaleState, SaleEvent> autoTransitionResult = null;

                Task.Factory.StartNew(async () =>
                {
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] execution thread: starting");
                    mutex.WaitOne();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] execution thread: got mutex");
                    autoTransitionResult = await sut.ExecuteAutoTransitionAsync(parameters, transitionResult);
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] execution thread: executed transition - Successful: {transitionResult.WasTransitioned}");
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] execution thread: executed transition - Cancelled: {transitionResult.WasCancelled}");
                    mutex.ReleaseMutex();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] execution thread: released mutex");
                }, TaskCreationOptions.LongRunning);

                try
                {
                    stopwatch.Start();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: started");
                    Task.Delay(millisecondsDelay: 2345).Wait();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: about to issue cancel");
                    cancelSource.Cancel();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: cancel issued");
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: about to wait on mutex");
                    mutex.WaitOne();
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: got mutex");
                }
                catch(Exception ex)
                {
                    Console.WriteLine($"[{stopwatch.ElapsedMilliseconds}] main thread: {ex}");
                    cancelSource.Cancel();
                }

                Assert.True(autoTransitionResult.WasCancelled);
                Assert.False(autoTransitionResult.ConditionMet);
                Assert.True(autoTransitionResult.TransitionDefined);
                Assert.Equal(SaleState.ChangeDue, sale.State);
                Assert.Equal(SaleState.ChangeDue, autoTransitionResult.CurrentState);
            }
        }

        [Fact]
        public async Task ExecuteEntryActionAsync_executes_EntryAction_based_on_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction((sale1, _) => { entryActionFromOpenFired = true; return Task.CompletedTask; }, SaleState.Open);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await sut.ExecuteEntryActionAsync(parameters, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public async Task ExecuteEntryActionAsyncWPrevState_doesnt_execute_if_cancelled()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction((sale1, _) => { entryActionFromOpenFired = true; return Task.CompletedTask; }, SaleState.Open);

            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancelSource.Token);
                cancelSource.Cancel();

                await sut.ExecuteEntryActionAsync(parameters, transitionResult);

                Assert.False(entryActionFromOpenFired);
            }
        }

        [Fact]
        public async Task ExecuteEntryActionAsync_doesnt_execute_if_cancelled()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction((sale1, _) => { entryActionFromOpenFired = true; return Task.CompletedTask; } );

            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancelSource.Token);
                cancelSource.Cancel();

                await sut.ExecuteEntryActionAsync(parameters, transitionResult);

                Assert.False(entryActionFromOpenFired);
            }
        }

        [Fact]
        public async Task ExecuteEntryActionAsync_executes_EntryAction_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction((sale1, _) => { entryActionFromOpenFired = true; return Task.CompletedTask; });
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await sut.ExecuteEntryActionAsync(parameters, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public async Task ExecuteReentryActionAsync_executes_superState_Action()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.Open };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.Open
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);
            var openEntryActionFromOpenFired = false;
            openState.AddReentryAction((sale1, _) => { openEntryActionFromOpenFired = true; return Task.CompletedTask; });
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await changeDueState.ExecuteReentryActionAsync(parameters, transitionResult);

            Assert.True(openEntryActionFromOpenFired);
        }

        [Fact]
        public async Task ExecuteReentryActionAsync_executes_ReentryAction()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.Open };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.Open
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);
            var changeDueEntryActionFromOpenFired = false;
            changeDueState.AddReentryAction((sale1, _) => { changeDueEntryActionFromOpenFired = true; return Task.CompletedTask; });
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await changeDueState.ExecuteReentryActionAsync(parameters, transitionResult);

            Assert.True(changeDueEntryActionFromOpenFired);
        }

        [Fact]
        public async Task ExecuteExitActionAsync_executes_based_on_next_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var openExitActionFired = false;
            openState.AddExitAction((sale1, _) => { openExitActionFired = true; return Task.CompletedTask; }, SaleState.ChangeDue);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await openState.ExecuteExitActionAsync(parameters, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public async Task ExecuteExitActionAsync_NextState_doesnt_execute_if_cancelled()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var openExitActionFired = false;
            openState.AddExitAction((sale1, _) => { openExitActionFired = true; return Task.CompletedTask; }, SaleState.ChangeDue);

            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancelSource.Token);
                cancelSource.Cancel();

                await openState.ExecuteExitActionAsync(parameters, transitionResult);
            }

            Assert.False(openExitActionFired);
        }

        [Fact]
        public async Task ExecuteExitActionAsync_executes_without_next_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            var openExitActionFired = false;
            openState.AddExitAction((sale1, _) => { openExitActionFired = true; return Task.CompletedTask; });
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            await openState.ExecuteExitActionAsync(parameters, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public async Task ExecuteExitActionAsync_doesnt_execute_if_cancelled()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            var openExitActionFired = false;
            openState.AddExitAction((sale1, _) => { openExitActionFired = true; return Task.CompletedTask; });

            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancelSource.Token);
                cancelSource.Cancel();

                await openState.ExecuteExitActionAsync(parameters, transitionResult);
            }

            Assert.False(openExitActionFired);
        }

        [Fact]
        public async Task FireTriggerAsync_executes_superState_if_currentState_not_successful()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStatePayTriggerFired = false;
            openState
                .AddTriggerAction(SaleEvent.Pay, (sale1, _) => { openStatePayTriggerFired = true; return Task.CompletedTask; })
                .AddTransition(SaleEvent.Pay, SaleState.Complete, name: "openStatePay");
            changeDueState.AddSuperState(openState);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            var result = await changeDueState.FireTriggerAsync(parameters);

            Assert.True(openStatePayTriggerFired);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.ChangeDue, result.StartingState);
            Assert.Equal("openStatePay", result.LastTransitionName);
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.Complete));
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state_is_subState()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfigurationAsync<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);

            Assert.True(changeDueState.IsInState(SaleState.Open));
            Assert.True(changeDueState.IsInState(SaleState.ChangeDue));
            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.ChangeDue));
        }
    }

    public class TestStateConfigurationAsync<T, TState, TTrigger> : StateConfigurationAsync<T, TState, TTrigger>
        where TState : IComparable
    {
        public TestStateConfigurationAsync(TState state, IStateMachineAsync<T, TState, TTrigger> stateMachine)
            : base(state, stateMachine)
        { }
    }
}
