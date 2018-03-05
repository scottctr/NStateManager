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
    public class StateConfigurationBaseTests
    {
        public class StateConfigurationBaseTester<T, TState, TTrigger> : StateConfigurationBase<T, TState, TTrigger> where TState : IComparable
        {
            public StateConfigurationBaseTester(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState)
                : base(toState, stateAccessor, stateMutator)
            {}
        }

        [Fact]
        public void Construtor_sets_properties()
        {
            SaleState StateAccessor(Sale sale) => sale.State;
            void StateMutator(Sale sale, SaleState newState) => sale.State = newState;
            var toState = SaleState.ChangeDue;

            var sut = new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(StateAccessor
              , StateMutator
              , toState);

            Assert.Equal(StateAccessor, sut.StateAccessor);
            Assert.Equal(StateMutator, sut.StateMutator);
            Assert.Equal(toState, sut.State);
        }

        [Fact]
        public void Construtor_throws_ArgumentNullException_if_Accessor_null()
        {
            Func<Sale, SaleState> stateAccessor = null;
            void StateMutator(Sale sale, SaleState newState) => sale.State = newState;
            var toState = SaleState.ChangeDue;

            Assert.Throws<ArgumentNullException>(() => new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(stateAccessor
              , StateMutator
              , toState));
        }

        [Fact]
        public void Construtor_throws_ArgumentNullException_if_Mutator_null()
        {
            SaleState StateAccessor(Sale sale) => sale.State;
            var toState = SaleState.ChangeDue;

            Assert.Throws<ArgumentNullException>(() => new StateConfigurationBaseTester<Sale, SaleState, SaleEvent>(StateAccessor
              , null
              , toState));
        }
    }
}
