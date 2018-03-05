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
    public class StateTransitionTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_condition_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransition<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Open
                , condition: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public void ExecuteAsync_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransition<Sale, SaleState, SaleEvent>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: endState
                , condition: (_) => true
                , name: "test"
                , priority: 1);

            var result = sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale));

            Assert.True(result.WasSuccessful);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public void ExecuteAsync_doesnt_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransition<Sale, SaleState, SaleEvent>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: endState
                , condition: (_) => false
                , name: "test"
                , priority: 1);

            var result = sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale));

            Assert.False(result.WasSuccessful);
            Assert.Equal(startState, sale.State);
        }
    }
}
