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
using NStateManager.Export;
using NStateManager.Sync;
using Xunit;
using Xunit.Abstractions;

namespace NStateManager.Tests.Export
{
    public class ConfigurationSummaryTests
    {
        private readonly ITestOutputHelper _testOutputHelper;

        public ConfigurationSummaryTests(ITestOutputHelper testOutputHelper)
        {
            _testOutputHelper = testOutputHelper;
        }

        [Fact]
        public void AddState_returns_stateDetails()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var stateDetails = sut.AddState(SaleState.Open);

            Assert.IsAssignableFrom<StateDetails<SaleState, SaleEvent>>(stateDetails);
        }

        [Fact]
        public void AddState_adds_stateDetails_to_list()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var stateDetails = sut.AddState(SaleState.Open);

            Assert.Contains(stateDetails, sut.StateDetails);
        }

        [Fact]
        public void Transitions_includes_transitions_from_all_states()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            var openTransition = openStateDetails.CreateTransitionFrom("openTransition"
              , SaleEvent.Pay
              , changeDueStateDetails);
            var changeDueTransition = changeDueStateDetails.CreateTransitionFrom("changeDueTransition"
              , SaleEvent.ChangeGiven
              , openStateDetails);

            Assert.Contains(openTransition, sut.Transitions);
            Assert.Contains(changeDueTransition, sut.Transitions);
        }

        [Fact]
        public void FinalStates_includes_states_that_have_transitions_to()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            openStateDetails.CreateTransitionFrom("openTransition", SaleEvent.Pay, changeDueStateDetails);

            Assert.Contains(changeDueStateDetails, sut.FinalStates);
        }

        [Fact]
        public void FinalStates_does_not_includes_states_that_have_transitions_from()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            openStateDetails.CreateTransitionFrom("openTransition", SaleEvent.Pay, changeDueStateDetails);
            changeDueStateDetails.CreateTransitionFrom("changeDueTransition", SaleEvent.ChangeGiven, openStateDetails);

            Assert.DoesNotContain(openStateDetails, sut.FinalStates);
            Assert.DoesNotContain(changeDueStateDetails, sut.FinalStates);
        }

        [Fact]
        public void StartingStates_includes_states_that_have_transitions_to()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            openStateDetails.CreateTransitionFrom("openTransition", SaleEvent.Pay, changeDueStateDetails);

            Assert.Contains(openStateDetails, sut.StartingStates);
            Assert.DoesNotContain(changeDueStateDetails, sut.StartingStates);
            Assert.DoesNotContain(openStateDetails, sut.FinalStates);
            Assert.Contains(changeDueStateDetails, sut.FinalStates);
        }

        [Fact]
        public void StartingStates_does_not_includes_states_that_have_transitions_to()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            openStateDetails.CreateTransitionFrom("openTransition", SaleEvent.Pay, changeDueStateDetails);
            changeDueStateDetails.CreateTransitionFrom("changeDueTransition", SaleEvent.ChangeGiven, openStateDetails);

            Assert.DoesNotContain(openStateDetails, sut.StartingStates);
            Assert.DoesNotContain(changeDueStateDetails, sut.StartingStates);
        }

        [Fact]
        public void SubStates_summarized_correctly()
        {
            var stateMachine  = new StateMachine<TestSale, TestSaleState, TestSaleEvent>(
                stateAccessor: sale1 => sale1.State,                   
                stateMutator: (sale1, state) => sale1.State = state); 
            stateMachine.ConfigureState(TestSaleState.Open)
                .AddTransition(TestSaleEvent.Cancel, TestSaleState.Cancelled, condition: sale => sale.IsCancellable())
                .AddTransition(TestSaleEvent.SetItemQuantity, TestSaleState.Overpaid, condition: sale => sale.HasPositiveBalance())
                .AddTransition(TestSaleEvent.SetItemQuantity, TestSaleState.Paid, condition: sale => sale.IsPaid)
                .AddTransition(TestSaleEvent.Pay, TestSaleState.Overpaid, condition: sale => sale.HasPositiveBalance())
                .AddTransition(TestSaleEvent.Pay, TestSaleState.Paid, condition: sale => sale.IsPaid);
            stateMachine.ConfigureState(TestSaleState.Overpaid)
                .MakeSubStateOf(stateMachine.ConfigureState(TestSaleState.Open)) // This inherits all of Open's configuration unless overridden
                // Overpaid can go back to Open if the balance goes negative
                .AddTransition(TestSaleEvent.GiveChange, TestSaleState.Open, condition: sale => sale.HasNegativeBalance())
                .AddTransition(TestSaleEvent.GiveChange, TestSaleState.Paid, condition: sale => sale.IsPaid)
                .AddTransition(TestSaleEvent.AddItem, TestSaleState.Open, condition: sale => sale.HasNegativeBalance())
                .AddTransition(TestSaleEvent.SetItemQuantity, TestSaleState.Open, condition: sale => sale.HasNegativeBalance())
                .AddTransition(TestSaleEvent.SetItemQuantity, TestSaleState.Paid, condition: sale => sale.IsPaid);
            stateMachine.ConfigureState(TestSaleState.Finalized);
                // This is the parent class for any finalized state -- Paid and Cancelled
                // -- No actions or transitions allowed
            stateMachine.ConfigureState(TestSaleState.Paid)
                .MakeSubStateOf(stateMachine.ConfigureState(TestSaleState.Finalized));
            stateMachine.ConfigureState(TestSaleState.Cancelled)
                .MakeSubStateOf(stateMachine.ConfigureState(TestSaleState.Finalized));

            var configSummary = stateMachine.GetSummary();

            _testOutputHelper.WriteLine(DotGraphExporter<TestSaleState, TestSaleEvent>.Export(configSummary));

            Assert.Equal(0, configSummary.StartingStates.Count);
            Assert.Contains(configSummary.FinalStates, s => s.State == TestSaleState.Cancelled);
            Assert.Contains(configSummary.FinalStates, s => s.State == TestSaleState.Paid);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Open && t.ToState.State == TestSaleState.Cancelled && t.Trigger == TestSaleEvent.Cancel);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Open && t.ToState.State == TestSaleState.Overpaid && t.Trigger == TestSaleEvent.SetItemQuantity);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Open && t.ToState.State == TestSaleState.Paid && t.Trigger == TestSaleEvent.SetItemQuantity);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Open && t.ToState.State == TestSaleState.Overpaid && t.Trigger == TestSaleEvent.Pay);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Open && t.ToState.State == TestSaleState.Paid && t.Trigger == TestSaleEvent.Pay);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Overpaid && t.ToState.State == TestSaleState.Open && t.Trigger == TestSaleEvent.GiveChange);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Overpaid && t.ToState.State == TestSaleState.Open && t.Trigger == TestSaleEvent.AddItem);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Overpaid && t.ToState.State == TestSaleState.Open && t.Trigger == TestSaleEvent.SetItemQuantity);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Overpaid && t.ToState.State == TestSaleState.Paid && t.Trigger == TestSaleEvent.GiveChange);
            Assert.Contains(configSummary.Transitions, t => t.FromState.State == TestSaleState.Overpaid && t.ToState.State == TestSaleState.Paid && t.Trigger == TestSaleEvent.SetItemQuantity);
        }
    }
}
