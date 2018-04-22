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
    public class StateTransitionAutoFallbackParameterizedTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Condition_is_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Complete
                , SaleState.Open
                , condition: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public void Execute_throws_ArgumentException_if_parameter_wrong_type()
        {
            var sut = new StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Complete
                , SaleState.Open
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            Assert.Throws<ArgumentException>(() => sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(saleID: 9), request: 0)
              , new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                  , SaleState.Complete
                  , SaleState.Complete
                  , SaleState.Complete
                  , "transactionName")));
        }

        [Fact]
        public void Execute_transitions_if_condition_met()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.ChangeDue} ;

            var sut = new StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.ChangeDue
                , SaleState.ChangeDue
                , SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "yes")
               , new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                  , SaleState.ChangeDue
                  , SaleState.ChangeDue
                  , SaleState.ChangeDue
                  , "transactionName"));

            Assert.Equal(SaleState.Complete, testSale.State);
        }

        [Fact]
        public void Execute_doesnt_transition_if_condition_not_met()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.Open };

            var sut = new StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Complete
                , SaleState.Open
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "NO"), GetDummyResult());

            Assert.Equal(SaleState.Open, testSale.State);
        }

        [Fact]
        public void Execute_sends_notification_if_transition_successful()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.Open };

            var sut = new StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Open
                , SaleState.Open
                , SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            var notificationReceived = false;
            StateTransitionAutoFallbackParameterized<Sale, SaleState, SaleEvent, string>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "yes")
               , new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                  , SaleState.Open
                  , SaleState.Open
                  , SaleState.Complete
                  , "transactionName"));

            Assert.True(notificationReceived);
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
