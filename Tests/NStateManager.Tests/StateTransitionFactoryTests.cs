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
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , toState: SaleState.Complete
                , condition: _ => true
                , name: "test"
                , priority: 1);

            Assert.IsType<StateTransition<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResult_returns_StateTransitionParameterized()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , toState: SaleState.Complete
              , condition: (sale, stringParam) => true
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionParameterized<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResultAndAsyncCondition_returns_StateTransitionParameterizedAsync()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , toState: SaleState.Complete
              , conditionAsync: (sale, stringParam, cancelToken) => Task.FromResult(true)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionParameterizedAsync<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransitionWithAsyncCondition_returns_StateTransitionAsync()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , toState: SaleState.Complete
              , conditionAsync: (sale, cancelToken) => Task.FromResult(true)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionAsync<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithStateFunc_returns_StateTransitionDynamic()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , stateFunc: (sale) => SaleState.Complete  
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamic<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithAsyncStateFunc_returns_StateTransitionDynamic()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Complete)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResultAndStateFunc_returns_StateTransitionDynamicParameterized()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , stateFunc: (sale, stringParam) => SaleState.Complete
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamicParameterized<Sale, SaleState, SaleEvent, string>>(result);
        }

        [Fact]
        public void GetStateTransitionWithTResultAndAsyncStateFunc_returns_StateTransitionDynamicParameterizedAsync()
        {
            var result = StateTransitionFactory<Sale, SaleState, SaleEvent>.GetStateTransition<string>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , fromState: SaleState.Open
              , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
              , name: "test"
              , priority: 1);

            Assert.IsType<StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>>(result);
        }

    }
}
