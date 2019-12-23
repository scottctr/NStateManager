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
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionDynamicTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_stateFunc_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionDynamic<Sale, SaleState, SaleEvent>(
                    stateAccessor: sale => sale.State
                    , stateMutator: (sale, newState) => sale.State = newState
                    , stateFunc: null
                    , name: "test"
                    , priority: 1));
        }

        [Fact]
        public void Execute_transitions_based_on_stateFunc()
        {
            var sut = new StateTransitionDynamic<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFunc: (sale) => SaleState.Complete
                , name: "test"
                , priority: 1);

            var testSale = new Sale(saleID: 87) { State = SaleState.Open };
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale);

            var result = sut.Execute(parameters);

            Assert.Equal(SaleState.Complete, testSale.State);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }

        [Fact]
        public void Execute_treats_lack_of_transitions_as_failed_condition()
        {
            var sut = new StateTransitionDynamic<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFunc: (sale) => SaleState.Open
                , name: "test"
                , priority: 1);

            var testSale = new Sale(saleID: 87) { State = SaleState.Open };
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale);

            var result = sut.Execute(parameters);

            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.False(result.WasCancelled);
            Assert.Equal(SaleState.Open, testSale.State);
            Assert.Equal(SaleState.Open, result.CurrentState);
            Assert.Equal(SaleState.Open, result.PreviousState);
        }
    }
}
