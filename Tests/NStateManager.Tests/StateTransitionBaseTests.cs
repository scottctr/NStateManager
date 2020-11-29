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
    public class StateTransitionBaseTests
    {
        public class StateTransitionTester<T, TState, TTrigger> : StateTransitionNonDynamic<T, TState, TTrigger>
        {
            public StateTransitionTester(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, string name, uint priority)
                : base(stateAccessor, stateMutator, toState, name, priority)
            {}

            public Func<T, TState> GetStateAccessor() { return StateAccessor; }
            public Action<T, TState> GetStateMutator() { return StateMutator; }
            public string GetName() { return Name; }
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_stateAccessor_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionTester<Sale, SaleState, SaleEvent>(stateAccessor: null
              , stateMutator: (sale, newState) => sale.State = newState
              , toState: SaleState.Complete
              , name: "tester"
              , priority: 1));
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_stateMutator_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionTester<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: null
              , toState: SaleState.Complete
              , name: "tester"
              , priority: 1));
        }

        [Fact]
        public void Constructor_sets_properties()
        {
            SaleState StateAccessor(Sale sale) => sale.State;
            void StateMutator(Sale sale, SaleState newState) => sale.State = newState;
            var toState = SaleState.ChangeDue;
            var name = "testName";
            uint priority = 97;

            var sut = new StateTransitionTester<Sale, SaleState, SaleEvent>(StateAccessor
              , StateMutator
              , toState
              , name
              , priority);

            Assert.Equal(StateAccessor, sut.GetStateAccessor());
            Assert.Equal(StateMutator, sut.GetStateMutator());
            Assert.Equal(toState, sut.ToState);
            Assert.Equal(name, sut.GetName());
            Assert.Equal(priority, sut.Priority);
        }

        [Fact]
        public void Execute_throws_NotImplementedException()
        {
            var sut = new StateTransitionTester<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , toState: SaleState.Complete
              , name: "tester"
              , priority: 1);

            Assert.Throws<NotImplementedException>(() => sut.Execute(parameters: null));
        }

        [Fact]
        public async Task ExecuteAsync_throws_NotImplementedException()
        {
            var sut = new StateTransitionTester<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , toState: SaleState.Complete
              , name: "tester"
              , priority: 1);

            await Assert.ThrowsAsync<NotImplementedException>(() => sut.ExecuteAsync(parameters: null));
        }
    }
}
