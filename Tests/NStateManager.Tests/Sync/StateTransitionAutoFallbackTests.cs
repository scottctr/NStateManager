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
using NStateManager.Sync;
using Xunit;

namespace NStateManager.Tests.Sync
{
    public class StateTransitionAutoFallbackTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_condition_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoFallback<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , SaleState.Open
                , triggerState: SaleState.Open
                , toState: SaleState.Open
                , condition: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public void Execute_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoFallback<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , startState
                , toState: endState
                , condition: _ => true
                , triggerState: startState
                , name: "test"
                , priority: 1);

            var result = sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), GetDummyResult());

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public void Execute_doesnt_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoFallback<Sale, SaleState, SaleEvent>(
                GetStateMachine()
                , startState
                , toState: endState
                , condition: _ => false
                , triggerState: startState
                , name: "test"
                , priority: 1);

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), GetDummyResult());

            Assert.Equal(startState, sale.State);
        }

        private StateTransitionResult<SaleState, SaleEvent> GetDummyResult()
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName");
        }

        private IStateMachine<Sale, SaleState, SaleEvent> GetStateMachine()
        {
            return new StateMachine<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
