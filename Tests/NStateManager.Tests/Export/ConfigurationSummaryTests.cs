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
using Xunit;

namespace NStateManager.Tests.Export
{
    public class ConfigurationSummaryTests
    {
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
        public void FinalStates_doesnt_includes_states_that_have_transitions_from()
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
        public void StartingStates_doesnt_includes_states_that_have_transitions_to()
        {
            var sut = new ConfigurationSummary<SaleState, SaleEvent>();

            var openStateDetails = sut.AddState(SaleState.Open);
            var changeDueStateDetails = sut.AddState(SaleState.ChangeDue);
            openStateDetails.CreateTransitionFrom("openTransition", SaleEvent.Pay, changeDueStateDetails);
            changeDueStateDetails.CreateTransitionFrom("changeDueTransition", SaleEvent.ChangeGiven, openStateDetails);

            Assert.DoesNotContain(openStateDetails, sut.StartingStates);
            Assert.DoesNotContain(changeDueStateDetails, sut.StartingStates);
        }
    }
}
