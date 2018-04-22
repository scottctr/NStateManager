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
    public class StateConfigurationTests
    {
        [Fact]
        public void AddAutoDynamicTransition_adds_transition()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddDynamicTransition(SaleEvent.Pay, sale => SaleState.Complete, "toCompleteTest");

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddAutoDynamicTransitionWRequest_adds_transition()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddDynamicTransition<string>(SaleEvent.Pay, (sale, stringParam) => SaleState.Complete, "toCompleteTest");

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddAutoForwardTransition_throws_ArgumentNullException_if_condition_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddAutoForwardTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, (sale) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, (sale) => true));
        }

        [Fact]
        public void AddAutoForwardTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam) => true));
        }

        [Fact]
        public void AddAutoForwardTransitionWRequest_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoForwardTransition<string>(SaleEvent.Pay, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddDynamicTransition_throws_ArgumentNullException_if_Function_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition(SaleEvent.AddItem, function: null));
        }

        [Fact]
        public void AddDynamicTransitionWRequest_throws_ArgumentNullException_if_Function_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition<string>(SaleEvent.AddItem, function: null));
        }

        [Fact]
        public void AddEntryAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null));
        }

        [Fact]
        public void AddEntryAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddEntryAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddEntryAction(sale => Task.Delay(1), previousState: SaleState.Open);

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction(sale => Task.Delay(1), SaleState.Open));
        }

        [Fact]
        public void AddExitAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddExitAction(action: null));
        }

        [Fact]
        public void AddExitAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddExitAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddExitAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddExitActionWNextState_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddExitAction(sale => Task.Delay(1), SaleState.Complete);

            Assert.Throws<InvalidOperationException>(() => sut.AddExitAction(sale => Task.Delay(1), SaleState.Complete));
        }

        [Fact]
        public void AddExitActionWNextState_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddExitAction(action: null, nextState: SaleState.Complete));
        }

        [Fact]
        public void AddAutoFallbackTransition_adds_transition_to_both_states()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, condition: sale => true);

            Assert.Single(sut.Transitions);

            StateConfiguration<Sale, SaleState, SaleEvent> tempStateConfig = stateMachine.ConfigureState(SaleState.Complete) as StateConfiguration<Sale, SaleState, SaleEvent>;
            Assert.Single(tempStateConfig.AutoTransitions);
        }

        [Fact]
        public void AddAutoFallbackTransition_throws_ArgumentNullException_if_condition_is_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddAutoFallbackTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, sale => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, sale => true));
        }

        [Fact]
        public void AddAutoFallbackTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoFallbackTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam) => true));
        }

        [Fact]
        public void AddAutoFallbackTransition_with_previousState_adds_transition_to_both_states()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, SaleState.ChangeDue, condition: sale => true);

            Assert.Single(sut.Transitions);

            StateConfiguration<Sale, SaleState, SaleEvent> tempStateConfig = stateMachine.ConfigureState(SaleState.Complete) as StateConfiguration<Sale, SaleState, SaleEvent>;
            Assert.Single(tempStateConfig.AutoTransitions);
        }

        [Fact]
        public void AddAutoFallbackTransitionWPreviousState_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Open, _=> true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Open, _=> true));
        }

        [Fact]
        public void AddAutoFallbackTransitionWPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Complete, condition: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddAutoFallbackTransitionWRequestPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoFallbackTransition(SaleEvent.Pay, SaleState.Open, condition: (null as Func<Sale, string, bool>)));
        }

        [Fact]
        public void AddReentryAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddReentryAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddReentryAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_configuredState_already_substate()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            //First time works fine
            sut.AddSuperState(openStateConfig);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => sut.AddSuperState(openStateConfig));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_substate_is_already_superstate()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var changeDueStteConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            //First time works fine
            openStateConfig.AddSuperState(changeDueStteConfig);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => openStateConfig.AddSuperState(changeDueStteConfig));
        }

        [Fact]
        public void AddSuperState_throws_InvalidOperationException_if_substate_is_already_superstate()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var changeDueStteConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var openStateConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            //First time works fine
            openStateConfig.AddSuperState(changeDueStteConfig);

            //Second time blows up
            Assert.Throws<InvalidOperationException>(() => changeDueStteConfig.AddSuperState(openStateConfig));
        }

        [Fact]
        public void AddTransitionWRequest_adds_transition()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTransition<string>(SaleEvent.Pay, SaleState.Complete, (sale, stringParam) => true);

            Assert.Single(sut.Transitions);
        }

        [Fact]
        public void AddTransitionWRequest_throws_ArgumentNullException_if_Condition_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTransition<string>(SaleEvent.AddItem, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddTriggerAction_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTriggerAction(SaleEvent.Pay, sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction(SaleEvent.Pay, sale => Task.Delay(1)));
        }

        [Fact]
        public void AddTriggerAction_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_InvalidOperationException_if_already_set()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam) => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam) => Task.Delay(1)));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_ArgumentNullException_if_Action_null()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale => sale.State, (sale, newState) => sale.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction<string>(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public void ExecuteAutoTransition_executes_AutoTransition_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.ChangeGiven
                , SaleState.Open
                , SaleState.ChangeDue
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            sut.AddAutoForwardTransition(SaleEvent.ChangeGiven, SaleState.Complete, sale1 => true);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = sut.ExecuteAutoTransition(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public void ExecuteAutoTransition_executes_AutoTransition_for_superState()
        {
            //Scenario: Sale has been paid for and goes to ChangeDue. If no change due, it should automatically transition to Complete.
            //ChangeDue is a substate of Open and Open has the autoForward defined for Pay.
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };

            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            IStateConfigurationInternal<Sale, SaleState, SaleEvent> openState = stateMachine.ConfigureState(SaleState.Open) as IStateConfigurationInternal<Sale, SaleState, SaleEvent>;
            IStateConfigurationInternal<Sale, SaleState, SaleEvent> changeDueState = stateMachine.ConfigureState(SaleState.ChangeDue) as IStateConfigurationInternal<Sale, SaleState, SaleEvent>;
            changeDueState?.AddSuperState(openState);
            openState?.AddAutoForwardTransition(SaleEvent.Pay, SaleState.Complete, sale1 => true /* condition indicates no change due */);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            var autoTransitionResult = changeDueState?.ExecuteAutoTransition(parameters, transitionResult);

            Assert.True(autoTransitionResult?.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult?.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult?.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult?.StartingState);
        }

        [Fact]
        public void ExecuteEntryAction_executes_EntryAction_based_on_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction(sale1 => { entryActionFromOpenFired = true; }, SaleState.Open);

            sut.ExecuteEntryAction(sale, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteEntryAction_executes_EntryAction_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction(sale1 => { entryActionFromOpenFired = true; });

            sut.ExecuteEntryAction(sale, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteReentryAction_executes_superState_Action()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.Open };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.Open
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);
            var openEntryActionFromOpenFired = false;
            openState.AddReentryAction(sale1 => { openEntryActionFromOpenFired = true; });

            changeDueState.ExecuteReentryAction(sale, transitionResult);

            Assert.True(openEntryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteReentryAction_executes_ReentryAction()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.Open };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.Open
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);
            var changeDueEntryActionFromOpenFired = false;
            changeDueState.AddReentryAction(sale1 => { changeDueEntryActionFromOpenFired = true; });

            changeDueState.ExecuteReentryAction(sale, transitionResult);

            Assert.True(changeDueEntryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteExitAction_executes_based_on_next_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.AddItem
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var openExitActionFired = false;
            openState.AddExitAction(sale1 => { openExitActionFired = true; }, SaleState.ChangeDue);

            openState.ExecuteExitAction(sale, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public void ExecuteExitAction_executes_without_next_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                , SaleState.Open
                , SaleState.Open
                , SaleState.ChangeDue
                , "lastTransitionName");
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            var openExitActionFired = false;
            openState.AddExitAction(sale1 => { openExitActionFired = true; });

            openState.ExecuteExitAction(sale, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public void FireTrigger_executes_superState_if_currentState_not_successful()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var openStatePayTriggerFired = false;
            openState
                .AddTriggerAction(SaleEvent.Pay, sale1 => { openStatePayTriggerFired = true; })
                .AddTransition(SaleEvent.Pay, SaleState.Complete, name: "openStatePay");
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            var result = changeDueState.FireTrigger(parameters);

            Assert.True(openStatePayTriggerFired);
            Assert.True(result.WasTransitioned);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.ChangeDue, result.StartingState);
            Assert.Equal("openStatePay", result.LastTransitionName);
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);

            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.Complete));
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state_is_subState()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(sale1 => sale1.State, (sale1, newState) => sale1.State = newState);
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open, stateMachine);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue, stateMachine);
            changeDueState.AddSuperState(openState);

            Assert.True(changeDueState.IsInState(SaleState.Open));
            Assert.True(changeDueState.IsInState(SaleState.ChangeDue));
            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.ChangeDue));
        }
    }

    public class TestStateConfiguration<T, TState, TTrigger> : StateConfiguration<T, TState, TTrigger>
        where TState : IComparable
    {
        public TestStateConfiguration(TState state, IStateMachine<T, TState, TTrigger> stateMachine)
            : base(state, stateMachine)
        { }
    }
}
