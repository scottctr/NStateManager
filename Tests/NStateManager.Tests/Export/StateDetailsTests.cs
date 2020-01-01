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
using System;
using Xunit;

namespace NStateManager.Tests.Export
{
    public class StateDetailsTests
    {
        [Fact]
        public void Constructor_creates_instance()
        {
            Assert.IsAssignableFrom<StateDetails<SaleState, SaleEvent>>(new StateDetails<SaleState, SaleEvent>(SaleState.Open));
        }

        [Fact]
        public void Constructor_initializes_IsFinalState_true()
        {
            Assert.True(new StateDetails<SaleState, SaleEvent>(SaleState.Open).IsFinalState);
        }

        [Fact]
        public void AddSubState_adds_sub_state()
        {
            var subState = new StateDetails<SaleState, SaleEvent>(SaleState.ChangeDue);
            var sut = new StateDetails<SaleState, SaleEvent>(SaleState.Open);

            sut.AddSubState(subState);

            Assert.True(sut.IsSuperState);
            Assert.False(subState.IsSuperState);

            Assert.Equal(sut, subState.SuperState);
            Assert.Contains(subState, sut.SubStates);

            Assert.True(subState.HasSuperState);
            Assert.False(sut.HasSuperState);

            Assert.Same(sut, subState.SuperState);
        }

        [Fact]
        public void AddSuperState_adds_super_state()
        {
            var superState = new StateDetails<SaleState, SaleEvent>(SaleState.ChangeDue);
            var sut = new StateDetails<SaleState, SaleEvent>(SaleState.Open);

            sut.AddSuperState(superState);

            Assert.True(sut.HasSuperState);
            Assert.False(superState.HasSuperState);

            Assert.True(superState.IsSuperState);
            Assert.False(sut.IsSuperState);

            Assert.Same(superState, sut.SuperState);
            Assert.Contains(sut, superState.SubStates);
        }

        [Fact]
        public void AddSuperState_throws_exception_if_existing_different_sub_state()
        {
            var superState1 = new StateDetails<SaleState, SaleEvent>(SaleState.ChangeDue);
            var superState2 = new StateDetails<SaleState, SaleEvent>(SaleState.Complete);
            var sut = new StateDetails<SaleState, SaleEvent>(SaleState.Open);
            sut.AddSuperState(superState1);

            Assert.Throws<InvalidOperationException>(() => sut.AddSuperState(superState2));
        }

        [Fact]
        public void CreateTransitionFrom_creates_transition_from_state()
        {
            var completeState = new StateDetails<SaleState, SaleEvent>(SaleState.Complete);
            var sut = new StateDetails<SaleState, SaleEvent>(SaleState.Open);

            var transition = sut.CreateTransitionFrom("completeTransition"
              , SaleEvent.Pay
              , completeState);

            Assert.Contains(transition, sut.TransitionsFrom);
            Assert.False(sut.IsFinalState);
            Assert.Contains(transition, completeState.TransitionsTo);
            Assert.False(completeState.IsStartingState);
        }

        [Fact]
        public void CreateTransitionTo_creates_transition_to_state()
        {
            var openState = new StateDetails<SaleState, SaleEvent>(SaleState.Open);
            var sut = new StateDetails<SaleState, SaleEvent>(SaleState.Complete);

            var transition = sut.CreateTransitionTo("completeTransition"
                , openState
                , SaleEvent.Pay);

            Assert.Contains(transition, sut.TransitionsTo);
            Assert.True(sut.IsFinalState);
            Assert.False(sut.IsStartingState);
            Assert.Contains(transition, openState.TransitionsFrom);
            Assert.True(openState.IsStartingState);
            Assert.False(openState.IsFinalState);
        }

        [Fact]
        public void HasSuperState_initialized_false()
        {
            Assert.False(new StateDetails<SaleState, SaleEvent>(SaleState.Open).HasSuperState);
        }

        [Fact]
        public void IsStartingState_initialized_true()
        {
            Assert.True(new StateDetails<SaleState, SaleEvent>(SaleState.Open).IsStartingState);
        }
    }
}
