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
using System.Linq;
using Xunit;

namespace NStateManager.Tests
{
    public class StateConfigurationBaseTests
    {
        public class StateConfigurationBaseTester<T, TState, TTrigger> : StateConfigurationBase<T, TState, TTrigger> where TState : IComparable
        {
            public StateConfigurationBaseTester(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState state)
                : base(state, stateAccessor, stateMutator)
            {}

            internal bool ContainsTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition)
            {
                var existingTransition = Transitions[trigger].Single();

                return existingTransition == transition;
            }
        }

        [Fact]
        public void Constructor_sets_properties()
        {
            SaleState StateAccessor(Sale sale) => sale.State;
            void StateMutator(Sale sale, SaleState newState) => sale.State = newState;
            const SaleState toState = SaleState.ChangeDue;

            var sut = new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(StateAccessor
              , StateMutator
              , toState);

            Assert.Equal(StateAccessor, sut.StateAccessor);
            Assert.Equal(StateMutator, sut.StateMutator);
            Assert.Equal(toState, sut.State);
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Accessor_null()
        {
            Func<Sale, SaleState> stateAccessor = null;
            void StateMutator(Sale sale, SaleState newState) => sale.State = newState;
            const SaleState toState = SaleState.ChangeDue;

            Assert.Throws<ArgumentNullException>(() => new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(stateAccessor
              , StateMutator
              , toState));
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Mutator_null()
        {
            SaleState StateAccessor(Sale sale) => sale.State;
            const SaleState toState = SaleState.ChangeDue;

            Assert.Throws<ArgumentNullException>(() => new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(StateAccessor
              , stateMutator: null
              , state: toState));
        }

        [Fact]
        public void AddTransition_adds_transition()
        {
            var transition = new StateTransition<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , toState: SaleState.Complete
              , name: "testTransition"
              , priority: 1
              , condition: _ => true);
            var sut = new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState 
              , state: SaleState.Open);

            sut.AddTransition(SaleEvent.AddItem, transition);

            Assert.True(sut.ContainsTransition(SaleEvent.AddItem, transition));
        }

        [Fact]
        public void AddTransition_throws_InvalidOperationException_if_transition_for_same_trigger_and_priority()
        {
            var transition = new StateTransition<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , toState: SaleState.Complete
              , name: "testTransition"
              , priority: 1
              , condition: _ => true);
            var sut = new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , state: SaleState.Open);

            //Succeeds first time
            sut.AddTransition(SaleEvent.AddItem, transition);
            Assert.True(sut.ContainsTransition(SaleEvent.AddItem, transition));

            Assert.Throws<InvalidOperationException>(() => sut.AddTransition(SaleEvent.AddItem, transition));
        }
    }
}
