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
        public void AddAutoTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddAutoTransition(SaleState.Complete, (sale) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoTransition(SaleState.Complete, (sale) => true));
        }

        [Fact]
        public void AddAutoTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddAutoTransition<string>(SaleState.Complete, (sale, stringParam) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddAutoTransition<string>(SaleState.Complete, (sale, stringParam) => true));
        }

        [Fact]
        public void AddAutoTransitionWPreviousState_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddAutoTransition(SaleState.Complete, sale => true, SaleState.Open);

            Assert.Throws<InvalidOperationException>(() 
                => sut.AddAutoTransition(SaleState.Complete, sale => true, SaleState.Open));
        }

        [Fact]
        public void AddAutoTransitionWPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddAutoTransition(SaleState.Complete, condition: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddAutoTransitionWRequestPreviousState_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddAutoTransition<string>(SaleState.Complete, (sale, stringParam) => true, SaleState.Open);

            Assert.Throws<InvalidOperationException>(()
                => sut.AddAutoTransition<string>(SaleState.Complete, (sale, stringParam) => true, SaleState.Open));
        }

        [Fact]
        public void AddAutoTransitionWRequestPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() 
                => sut.AddAutoTransition<string>(SaleState.Complete, condition: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddDynamicTransition_throws_ArgumentNullException_if_Function_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition(SaleEvent.AddItem, function: null));
        }

        [Fact]
        public void AddDynamicTransitionWRequest_throws_ArgumentNullException_if_Function_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddDynamicTransition<string>(SaleEvent.AddItem, function: null));
        }

        [Fact]
        public void AddEntryAction_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null));
        }

        [Fact]
        public void AddEntryAction_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddEntryAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddEntryAction(action: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddEntryActionWPrevious_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddEntryAction(sale => Task.Delay(1), previousState: SaleState.Open);

            Assert.Throws<InvalidOperationException>(() => sut.AddEntryAction(sale => Task.Delay(1), SaleState.Open));
        }

        [Fact]
        public void AddExitAction_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddExitAction(action: null));
        }

        [Fact]
        public void AddExitAction_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddExitAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddExitAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddFallbackTransition_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddFallbackTransition(sale => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddFallbackTransition(sale => true));
        }

        [Fact]
        public void AddFallbackTransitionWRequest_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddFallbackTransition<string>((sale, stringParam) => true);

            Assert.Throws<InvalidOperationException>(() => sut.AddFallbackTransition<string>((sale, stringParam) 
                => true));
        }

        [Fact]
        public void AddFallbackTransitionWPreviousState_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddFallbackTransition(sale => true, SaleState.Open);

            Assert.Throws<InvalidOperationException>(() => sut.AddFallbackTransition(sale => true, SaleState.Open));
        }

        [Fact]
        public void AddFallbackTransitionWPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddFallbackTransition(condition: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddFallbackTransitionWRequestPreviousState_throws_InvalidOperationException_if_AutoTransition_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddFallbackTransition<string>((sale, stringParam) => true, SaleState.Open);

            Assert.Throws<InvalidOperationException>(() => sut.AddFallbackTransition<string>((sale, stringParam) 
                => true, SaleState.Open));
        }

        [Fact]
        public void AddFallbackTransitionWRequestPreviousState_throws_ArgumentNullException_if_Condition_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddFallbackTransition<string>(condition: null, previousState: SaleState.Open));
        }

        [Fact]
        public void AddReentryAction_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddReentryAction(action: null));
        }

        [Fact]
        public void AddReentryAction_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddReentryAction(sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddReentryAction(sale => Task.Delay(1)));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_configuredState_already_substate()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);
            var openStateConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            //First time works fine
            sut.AddSuperState(openStateConfig);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => sut.AddSuperState(openStateConfig));
        }

        [Fact]
        public void AddSuperState_throws_ArgumentOutOfRangeException_if_substate_is_already_superstate()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);
            var openStateConfig = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            //First time works fine
            openStateConfig.AddSuperState(sut);

            //Second time blows up
            Assert.Throws<ArgumentOutOfRangeException>(() => openStateConfig.AddSuperState(sut));
        }

        [Fact]
        public void AddTransitionWRequest_throws_ArgumentNullException_if_Condition_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddTransition<string>(SaleEvent.AddItem, SaleState.Complete, condition: null));
        }

        [Fact]
        public void AddTriggerAction_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddTriggerAction(SaleEvent.Pay, sale => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction(SaleEvent.Pay, sale => Task.Delay(1)));
        }

        [Fact]
        public void AddTriggerAction_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_InvalidOperationException_if_already_set()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam) => Task.Delay(1));

            Assert.Throws<InvalidOperationException>(() => sut.AddTriggerAction<string>(SaleEvent.Pay, (sale, stringParam) => Task.Delay(1)));
        }

        [Fact]
        public void AddTriggerActionWRequest_throws_ArgumentNullException_if_Action_null()
        {
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            Assert.Throws<ArgumentNullException>(() => sut.AddTriggerAction<string>(SaleEvent.AddItem, action: null));
        }

        [Fact]
        public void ExecuteAutoTransition_executes_AutoTransition_based_on_previous_state_if_exists()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            sut.AddAutoTransition(SaleState.Complete, (sale1) => true, previousState: SaleState.Open);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = sut.ExecuteAutoTransition(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasSuccessful);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public void ExecuteAutoTransition_executes_AutoTransition_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            sut.AddAutoTransition(SaleState.Complete, sale1 => true);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = sut.ExecuteAutoTransition(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasSuccessful);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public void ExecuteAutoTransition_executes_AutoTransition_for_superState()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            changeDueState.AddSuperState(openState);
            openState.AddAutoTransition(SaleState.Complete, sale1 => true);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.ChangeGiven, sale);

            var autoTransitionResult = changeDueState.ExecuteAutoTransition(parameters, transitionResult);

            Assert.True(autoTransitionResult.WasSuccessful);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, autoTransitionResult.CurrentState);
            Assert.Equal(SaleState.ChangeDue, autoTransitionResult.PreviousState);
            Assert.Equal(SaleState.Open, autoTransitionResult.StartingState);
        }

        [Fact]
        public void ExecuteEntryAction_executes_EntryAction_based_on_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction(sale1 => { entryActionFromOpenFired = true; }, SaleState.Open);

            sut.ExecuteEntryAction(sale, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteEntryAction_executes_EntryAction_without_previous_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var sut = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var entryActionFromOpenFired = false;
            sut.AddEntryAction(sale1 => { entryActionFromOpenFired = true; });

            sut.ExecuteEntryAction(sale, transitionResult);

            Assert.True(entryActionFromOpenFired);
        }

        [Fact]
        public void ExecuteReentryAction_executes_superState_Action()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.Open };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "lastTransitionName");
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
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
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "lastTransitionName");
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
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
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var openExitActionFired = false;
            openState.AddExitAction(sale1 => { openExitActionFired = true; }, SaleState.ChangeDue);

            openState.ExecuteExitAction(sale, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public void ExecuteExitAction_executes_without_next_state()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var transitionResult = new StateTransitionResult<SaleState>(SaleState.Open
              , SaleState.Open
              , SaleState.ChangeDue
              , "lastTransitionName");
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);

            var openExitActionFired = false;
            openState.AddExitAction(sale1 => { openExitActionFired = true; });

            openState.ExecuteExitAction(sale, transitionResult);

            Assert.True(openExitActionFired);
        }

        [Fact]
        public void FireTrigger_executes_superState_if_currentState_not_successful()
        {
            var sale = new Sale(saleID: 96) { State = SaleState.ChangeDue };
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            var openStatePayTriggerFired = false;
            openState
                .AddTriggerAction(SaleEvent.Pay, sale1 => { openStatePayTriggerFired = true; })
                .AddTransition(SaleEvent.Pay, SaleState.Complete, name: "openStatePay");
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale.State
              , stateMutator: (sale1, newState) => sale.State = newState);
            changeDueState.AddSuperState(openState);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale);

            var result = changeDueState.FireTrigger(parameters);

            Assert.True(openStatePayTriggerFired);
            Assert.True(result.WasSuccessful);
            Assert.Equal(SaleState.Complete, sale.State);
            Assert.Equal(SaleState.Complete, result.CurrentState);
            Assert.Equal(SaleState.ChangeDue, result.PreviousState);
            Assert.Equal(SaleState.ChangeDue, result.StartingState);
            Assert.Equal("openStatePay", result.LastTransitionName);
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state()
        {
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale1.State
              , stateMutator: (sale1, newState) => sale1.State = newState);

            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.Complete));
        }

        [Fact]
        public void IsInState_returns_True_if_in_given_state_is_subState()
        {
            var openState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.Open
              , stateAccessor: sale1 => sale1.State
              , stateMutator: (sale1, newState) => sale1.State = newState);
            var changeDueState = new StateConfiguration<Sale, SaleState, SaleEvent>(SaleState.ChangeDue
              , stateAccessor: sale1 => sale1.State
              , stateMutator: (sale1, newState) => sale1.State = newState);
            changeDueState.AddSuperState(openState);

            Assert.True(changeDueState.IsInState(SaleState.Open));
            Assert.True(changeDueState.IsInState(SaleState.ChangeDue));
            Assert.True(openState.IsInState(SaleState.Open));
            Assert.False(openState.IsInState(SaleState.ChangeDue));
        }
    }
}
