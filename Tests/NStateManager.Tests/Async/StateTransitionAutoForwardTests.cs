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
using NStateManager.Async;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests.Async
{
    public class StateTransitionAutoForwardTests
    {
        //[Fact]
        //public void Constructor_throws_ArgumentNullException_if_condition_null()
        //{
        //    Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
        //        GetStateMachine()
        //        , triggerState: SaleState.Open
        //        , toState: SaleState.Open
        //        , conditionAsync: null
        //        , name: "test"
        //        , priority: 1));
        //}

        [Fact]
        public async void Execute_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , triggerState: startState
                , toState: endState
                , conditionAsync: (sale1, token) => Task.FromResult(true)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), getDummyResult());

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
            var sale = new Sale(saleId: 66) { State = SaleState.ChangeDue };
            var stateMachine = getStateMachine();

            var openStateConfig = stateMachine.ConfigureState(SaleState.Open);
            stateMachine.ConfigureState(SaleState.ChangeDue)
               .MakeSubStateOf(openStateConfig);

            var sut = new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
                stateMachine
              , triggerState: startState
              , toState: endState
              , conditionAsync: (_, cancelToke) => Task.FromResult(true)
              , name: "test"
              , priority: 1);
            var previousResult = getDummyResult();
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
        public async void Execute_does_not_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , triggerState: startState
                , toState: endState
                , conditionAsync: (_, cancelToken) => Task.FromResult(false)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), getDummyResult());

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
        public async void Execute_does_not_change_state_if_currentResult_is_null()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
                getStateMachine()
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
        public async void Execute_does_not_change_state_if_triggerState_does_not_match()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForward<Sale, SaleState, SaleEvent>(
                getStateMachine()
              , triggerState: SaleState.Complete
              , toState: endState
              , conditionAsync: (_, cancelToken) => Task.FromResult(false)
              , name: "test"
              , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), getDummyResult());

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.False(result.WasCancelled);
            Assert.True(result.TransitionDefined);
            Assert.Equal(startState, result.StartingState);
            Assert.Equal(startState, result.PreviousState);
            Assert.Equal(startState, result.CurrentState);
        }

        private static StateTransitionResult<SaleState, SaleEvent> getDummyResult()
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName");
        }

        private static IStateMachine<Sale, SaleState, SaleEvent> getStateMachine()
        {
            return new StateMachine<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
