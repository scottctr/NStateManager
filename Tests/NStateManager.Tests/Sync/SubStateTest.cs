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

using NStateManager.Sync;
using Xunit;
using Xunit.Abstractions;

namespace NStateManager.Tests
{
    public class Program
    {
        private readonly ITestOutputHelper _testOutputHelper;

        public Program(ITestOutputHelper testOutputHelper)
        {
            _testOutputHelper = testOutputHelper;
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
                .AddEntryAction(_ => _testOutputHelper.WriteLine("SuperState OnEntry"))
                .AddExitAction(_ => _testOutputHelper.WriteLine("SuperState OnExit"));

            stateMachine.ConfigureState(State.SubState)
                .MakeSubstateOf(stateMachine.ConfigureState(State.SuperState))
                .AddTransition(Trigger.Two, State.SuperState)
                .AddEntryAction(_ => _testOutputHelper.WriteLine("SubState OnEntry"))
                .AddExitAction(_ => _testOutputHelper.WriteLine("SubState OnExit"));

            stateMachine.OnTransition += (o, args) => _testOutputHelper.WriteLine($"{args.TransitionResult.StartingState} -[{args.TransitionResult.Trigger}]-> {args.TransitionResult.CurrentState}");

            var testEntity = new TestEntity();
            stateMachine.FireTrigger(testEntity, Trigger.One);
            stateMachine.FireTrigger(testEntity, Trigger.Two);
        }
    }
}
