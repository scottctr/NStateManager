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
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionFactoryTests
    {
        [Fact]
        public void GetStateTransition_returns_StateTransition()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => { });
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
                , toState: SaleState.Complete
                , condition: _ => true
                , name: "test"
                , priority: 1);

            Assert.IsType<StateTransition<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResult_returns_StateTransitionParameterized()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
              , toState: SaleState.Complete
              , condition: (sale, stringParam) => true
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionParameterized<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResultAndAsyncCondition_returns_StateTransitionParameterizedAsync()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
              , toState: SaleState.Complete
              , conditionAsync: (sale, stringParam, cancelToken) => Task.FromResult(true)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionParameterizedAsync<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransitionWithAsyncCondition_returns_StateTransitionAsync()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
              , toState: SaleState.Complete
              , conditionAsync: (sale, cancelToken) => Task.FromResult(true)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAsync<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithStateFunc_returns_StateTransitionDynamic()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
              , stateFunc: (sale) => SaleState.Complete  
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamic<Sale, SaleState, SaleEvent>>(result);
        }

        //[Fact]
        //public void GetStateTransitionWithAsyncStateFunc_returns_StateTransitionDynamic()
        //{
        //    var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
        //    var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
        //      , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Complete)
        //      , name: "test"
        //      , priority: 1);

        //    Assert.IsType<StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>>(result);
        //}

        [Fact]
        public void GetStateTransitionWithTResultAndStateFunc_returns_StateTransitionDynamicParameterized()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
              , stateFunc: (sale, stringParam) => SaleState.Complete
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamicParameterized<Sale, SaleState, SaleEvent, string>>(result);
        }

        //[Fact]
        //public void GetStateTransitionWithTResultAndAsyncStateFunc_returns_StateTransitionDynamicParameterizedAsync()
        //{
        //    var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
        //    var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
        //      , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
        //      , name: "test"
        //      , priority: 1);

        //    Assert.IsType<StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>>(result);
        //}

        [Fact]
        public void GetStateTransitionWithStateMachineAndStateFuction_returns_StateTransitionAutoDynamic()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
              , startState: SaleState.Open
              , stateFunction: _=> SaleState.Complete
              , triggerState: SaleState.ChangeDue
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAutoDynamic<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithStateMachineAndStateFuctionTRequest_returns_StateTransitionAutoDynamic()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
              , startState: SaleState.Open
              , stateFunction: (sale, stringParam) => SaleState.Complete
              , triggerState: SaleState.ChangeDue
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransactionWAsyncStateMachineStartStateAndTriggerState_returns_StateTransitionAutoDynamicAsync()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateMachine
              , startState: SaleState.Open
              , stateFunction: (sale) => SaleState.Complete
              , triggerState: SaleState.ChangeDue
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAutoDynamicAsync<Sale, SaleState, SaleEvent>>(result);
        }

        //public static StateTransitionBase<T, TState, TTrigger> GetStateTransition(IStateMachineAsync<T, TState, TTrigger> stateMachine, TState startState, Func<T, TState> stateFunction, TState triggerState, string name, uint priority = 1)
        //{
        //    return new StateTransitionAutoDynamicAsync<T, TState, TTrigger>(stateMachine, startState, stateFunction, triggerState, name, priority);
        //}

        [Fact]
        public void GetStateTransactionWTRequestAsyncStateMachineStartStateAndTriggerState_returns_StateTransitionAutoDynamicAsync()
        {
            var stateMachine = new StateMachineAsync<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateMachine
              , startState: SaleState.Open
              , stateFunction: (sale, stringParam) => SaleState.Complete
              , triggerState: SaleState.ChangeDue
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAutoDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>>(result);
        }

        //public static StateTransitionBase<T, TState, TTrigger> GetStateTransition<TRequest>(IStateMachineAsync<T, TState, TTrigger> stateMachine, TState startState, Func<T, TRequest, TState> stateFunction, TState triggerState, string name, uint priority = 1)
        //    where TRequest : class
        //{
        //    return new StateTransitionAutoDynamicParameterizedAsync<T, TState, TTrigger, TRequest>(stateMachine, startState, stateFunction, triggerState, name, priority);
        //}

    }
}
