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
    public class StateTransitionAutoDynamicParameterizedTests
    {
        [Fact]
        public void Execute_throws_ArgumentException_if_request_is_null_or_wrong_type()
        {
            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(getStateMachine()
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.ChangeDue
              , "autocomplete"
              , 1);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(2) { State = SaleState.Open }, request: 14);

            Assert.Throws<ArgumentException>(() => sut.Execute(parameters));
        }

        [Fact]
        public void Execute_fails_if_currentResult_is_null()
        {
            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(getStateMachine()
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.ChangeDue
              , "autocomplete"
              , 1);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(2) { State = SaleState.Open }, request: "testParam");

            var result = sut.Execute(parameters);

            Assert.False(result.WasTransitioned);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public void Execute_fails_if_startState_doesnt_match()
        {
            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(getStateMachine()
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.ChangeDue
              , "autocomplete"
              , 1);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(2) { State = SaleState.Open }, request: "testParam");
            var previousResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay, SaleState.Open, SaleState.ChangeDue, SaleState.ChangeDue, "autoChangeDue");

            var result = sut.Execute(parameters, previousResult);

            Assert.False(result.WasTransitioned);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public void Execute_fails_if_triggerState_doesnt_match()
        {
            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(getStateMachine()
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.ChangeDue
              , "autocomplete"
              , 1);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(2) { State = SaleState.Open }, request: "testParam");
            var previousResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay, SaleState.Open, SaleState.Open, SaleState.Open, "autoChangeDue");

            var result = sut.Execute(parameters, previousResult);

            Assert.False(result.WasTransitioned);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public void Execute_transitions_when_matched()
        {
            var stateMachine = getStateMachine();
            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(stateMachine
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.ChangeDue
              , "autocomplete"
              , priority: 1);

            var testSale = new Sale(saleId: 2) { State = SaleState.Open };
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "testParam");
            var previousResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay, SaleState.Open, SaleState.Open, SaleState.ChangeDue, "previousTransition");

            var result = sut.Execute(parameters, previousResult);

            Assert.True(result.WasTransitioned);
            Assert.Equal("autocomplete", result.LastTransitionName);
            Assert.Equal(SaleState.Complete, SaleState.Complete);
            Assert.Equal(SaleState.Complete, SaleState.Complete);
            Assert.Equal(SaleState.ChangeDue, SaleState.ChangeDue);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Complete, testSale.State);
        }

        [Fact]
        public void Execute_transitions_when_matched_superState()
        {
            var stateMachine = getStateMachine();
            var openStateConfig = stateMachine.ConfigureState(SaleState.Open);
            stateMachine.ConfigureState(SaleState.ChangeDue).MakeSubstateOf(openStateConfig);

            var sut = new StateTransitionAutoDynamicParameterized<Sale, SaleState, SaleEvent, string>(stateMachine
              , SaleState.Open
              , (sale, stringParam) => SaleState.Complete
              , SaleState.Open
              , "autoComplete"
              , priority: 1);
                
            var testSale = new Sale(saleId: 2) { State = SaleState.ChangeDue };
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "testParam");
            var previousResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay, SaleState.Open, SaleState.Open, SaleState.ChangeDue, "previousTransition");

            var result = sut.Execute(parameters, previousResult);

            Assert.True(result.WasTransitioned);
            Assert.Equal("autoComplete", result.LastTransitionName);
            Assert.Equal(SaleState.Complete, SaleState.Complete);
            Assert.Equal(SaleState.Complete, SaleState.Complete);
            Assert.Equal(SaleState.ChangeDue, SaleState.ChangeDue);
            Assert.Equal(SaleState.Open, result.StartingState);
            Assert.Equal(SaleState.Complete, testSale.State);
        }

        private StateMachine<Sale, SaleState, SaleEvent> getStateMachine()
        {
            return new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newSate) => sale.State = newSate);
        }
    }
}
