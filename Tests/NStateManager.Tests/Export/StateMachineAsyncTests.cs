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
using NStateManager.Async;
using System;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests.Export
{
    public class StateMachineAsyncTests
    {
        [Fact]
        public void GetSummary_includes_all_states()
        {
            var sut = getTestStateMachine();

            var summary = sut.GetSummary();

            Assert.Contains(summary.StateDetails, s => s.State == SaleState.Open);
            Assert.Contains(summary.StateDetails, s => s.State == SaleState.ChangeDue);
            Assert.Contains(summary.StateDetails, s => s.State == SaleState.Complete);
        }

        [Fact]
        public void GetSummary_includes_all_transitions()
        {
            var sut = getTestStateMachine();

            var summary = sut.GetSummary();

            Assert.Equal(3, summary.Transitions.Count);
            Assert.Contains(summary.Transitions, t => t.FromState.State.IsEqual(SaleState.Open) && t.ToState.State.IsEqual(SaleState.Complete) && t.HasCondition);
            Assert.Contains(summary.Transitions, t => t.FromState.State.IsEqual(SaleState.Open) && t.ToState.State.IsEqual(SaleState.ChangeDue) && t.HasCondition);
            Assert.Contains(summary.Transitions, t => t.FromState.State.IsEqual(SaleState.ChangeDue) && t.ToState.State.IsEqual(SaleState.Complete) && !t.HasCondition);
        }

        [Fact]
        public void GetSummary_includes_all_final_states()
        {
            var sut = getTestStateMachine();

            var summary = sut.GetSummary();

            Assert.Contains(summary.FinalStates, s => s.State == SaleState.Complete);
        }

        [Fact]
        public void GetSummary_includes_all_starting_states()
        {
            var sut = getTestStateMachine();

            var summary = sut.GetSummary();

            Assert.Contains(summary.StartingStates, s => s.State == SaleState.Open);
        }

        private StateMachine<Sale, SaleState, SaleEvent> getTestStateMachine()
        {
            var stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState);

            stateMachine.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, (sale1, _) => Task.FromResult(Math.Abs(sale1.Balance) < 0.00001))
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, (sale2, _) => Task.FromResult(sale2.Balance < 0));
            stateMachine.ConfigureState(SaleState.ChangeDue)
               .AddTransition(SaleEvent.ChangeGiven, SaleState.Complete);

            return stateMachine;
        }
    }
}
