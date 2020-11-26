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
    public class StateTransitionAutoForwardParameterizedTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_ConditionAsync_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoForwardParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Open
                , SaleState.ChangeDue
                , condition: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public void ExecuteAsync_throws_ArgumentException_if_Request_not_provided()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , condition: (_, stringParam) => true
                , name: "test"
                , priority: 1);

            var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: null);

            Assert.Throws<ArgumentException>(() => sut.Execute(executionParams, GetDummyResult()));
        }

        [Fact]
        public void Execute_throws_ArgumentException_if_Request_is_wrong_type()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , condition: (_, stringParam) => true
                , name: "test"
                , priority: 1);

            var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: 1);

            Assert.Throws<ArgumentException>(() => sut.Execute(executionParams, GetDummyResult()));
        }

        [Fact]
        public void Execute_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForwardParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , toState: endState
                , triggerState: startState
                , condition: (_, stringParam) => true
                , name: "test"
                , priority: 1);

            var result = sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"), GetDummyResult());

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public void Execute_doesnt_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionAutoForwardParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , endState
                , startState
                , condition: (_, stringParam) => false
                , name: "test"
                , priority: 1);

            var result = sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"),
                new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                  , startState
                  , startState
                  , startState
                  , "transactionName"));

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.True(result.TransitionDefined);
        }

        private StateTransitionResult<SaleState, SaleEvent> GetDummyResult(bool wasCancelled = false)
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName"
              , wasCancelled: wasCancelled);
        }

        private IStateMachine<Sale, SaleState, SaleEvent> GetStateMachine()
        {
            return new StateMachine<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
