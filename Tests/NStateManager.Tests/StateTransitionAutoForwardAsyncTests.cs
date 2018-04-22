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
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionAutoForwardAsyncTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_condition_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , triggerState: SaleState.Open
                , toState: SaleState.Open
                , conditionAsync: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public async void Execute_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , triggerState: startState
                , toState: endState
                , conditionAsync: (sale1, token) => Task.FromResult(true)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), GetDummyResult());

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
            Assert.Equal(endState, result.CurrentState);
            Assert.Equal(startState, result.PreviousState);
            Assert.Equal(startState, result.StartingState);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public async void Execute_changes_state_for_superState()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = SaleState.ChangeDue };
            var stateMachine = GetStateMachine();

            var openStateConfig = stateMachine.ConfigureState(SaleState.Open);
            stateMachine.ConfigureState(SaleState.ChangeDue)
               .MakeSubStateOf(openStateConfig);

            var sut = new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                stateMachine
              , triggerState: startState
              , toState: endState
              , conditionAsync: (_, cancelToke) => Task.FromResult(true)
              , name: "test"
              , priority: 1);
            var previousResult = GetDummyResult();
            previousResult.CurrentState = SaleState.ChangeDue;

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), previousResult);

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
            Assert.Equal(endState, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(startState, result.StartingState);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public async void Execute_doesnt_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , triggerState: startState
                , toState: endState
                , conditionAsync: (_, cancelToken) => Task.FromResult(false)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), GetDummyResult());

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.False(result.WasCancelled);
            Assert.True(result.TransitionDefined);
            Assert.Equal(startState, result.StartingState);
            Assert.Equal(startState, result.PreviousState);
            Assert.Equal(startState, result.CurrentState);
        }

        [Fact]
        public async void Execute_doesnt_change_state_if_currentResult_is_null()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                GetStateMachine()
              , triggerState: startState
              , toState: endState
              , conditionAsync: (_, cancelToken) => Task.FromResult(false)
              , name: "test"
              , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), currentResult: null);

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.False(result.WasCancelled);
            Assert.True(result.TransitionDefined);
            Assert.Equal(startState, result.StartingState);
            Assert.Equal(startState, result.PreviousState);
            Assert.Equal(startState, result.CurrentState);
        }

        [Fact]
        public async void Execute_doesnt_change_state_if_triggerState_doesnt_match()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardAsync<Sale, SaleState, SaleEvent>(
                GetStateMachine()
              , triggerState: SaleState.Complete
              , toState: endState
              , conditionAsync: (_, cancelToken) => Task.FromResult(false)
              , name: "test"
              , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), GetDummyResult());

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.False(result.WasCancelled);
            Assert.True(result.TransitionDefined);
            Assert.Equal(startState, result.StartingState);
            Assert.Equal(startState, result.PreviousState);
            Assert.Equal(startState, result.CurrentState);
        }

        private StateTransitionResult<SaleState, SaleEvent> GetDummyResult()
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName");
        }

        private IStateMachineAsync<Sale, SaleState, SaleEvent> GetStateMachine()
        {
            return new StateMachineAsync<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
