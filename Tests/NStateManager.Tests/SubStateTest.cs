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
    public class Program
    {
        public enum TelephoneState { OnHook, OffHook, Connected }
        public enum TelephoneEvent { PickupHandset, HangUp, CallConnected }

        private class Telephone
        {
            public TelephoneState State { get; set; }
            public DateTime StartTime { get; set; }
            public DateTime EndTime { get; set; }
            public int MissedCalls { get; set; }
        }

        private class TestEntity
        { public State State { get; set; } }

        private enum State { SuperState, SubState }
        private enum Trigger { One, Two }

        [Fact]
        public void Test()
        {
            IStateMachine<TestEntity, State, Trigger> stateMachine = new StateMachine<TestEntity, State, Trigger>(
                stateAccessor: entity => entity.State
              , stateMutator: (entity, newState) => entity.State = newState);
            
            stateMachine.ConfigureState(State.SuperState)
                .AddTransition(Trigger.One, State.SubState)
                .AddEntryAction(_ => Console.WriteLine("SuperState OnEntry"))
                .AddExitAction(_ => Console.WriteLine("SuperState OnExit"));

            stateMachine.ConfigureState(State.SubState)
                .MakeSubStateOf(stateMachine.ConfigureState(State.SuperState))
                .AddTransition(Trigger.Two, State.SuperState)
                .AddEntryAction(_ => Console.WriteLine("SubState OnEntry"))
                .AddExitAction(_ => Console.WriteLine("SubState OnExit"));

            stateMachine.RegisterOnTransitionedAction(((_, result) => Console.WriteLine($"{result.StartingState} -[{result.Trigger}]-> {result.CurrentState}")));

            var testEntity = new TestEntity();
            stateMachine.FireTrigger(testEntity, Trigger.One);
            stateMachine.FireTrigger(testEntity, Trigger.Two);
        }
    }
}
