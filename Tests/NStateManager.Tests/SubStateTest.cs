using System;
using Xunit;

namespace NStateManager.Tests
{
    public class Program
    {
        private class TestEntity
        { public State State { get; set; } }

        private enum State { SuperState, SubState }
        private enum Trigger { X, Y }

        [Fact]
        public void Test()
        {
            IStateMachine<TestEntity, State, Trigger> stateMachine = new StateMachine<TestEntity, State, Trigger>(
                stateAccessor: entity => entity.State
              , stateMutator: (entity, newState) => entity.State = newState);
            
            stateMachine.ConfigureState(State.SuperState)
                .AddTransition(Trigger.X, State.SubState)
                .AddEntryAction(_ => Console.WriteLine("SuperState OnEntry"))
                .AddExitAction(_ => Console.WriteLine("SuperState OnExit"));

            stateMachine.ConfigureState(State.SubState)
                .IsSubStateOf(stateMachine.ConfigureState(State.SuperState))
                .AddTransition(Trigger.Y, State.SuperState)
                .AddEntryAction(_ => Console.WriteLine("SubState OnEntry"))
                .AddExitAction(_ => Console.WriteLine("SubState OnExit"));

            stateMachine.RegisterOnTransitionedEvent(((_, result) => Console.WriteLine($"{result.StartingState} --> {result.CurrentState}")));

            var testEntity = new TestEntity();
            stateMachine.FireTrigger(testEntity, Trigger.X);
            stateMachine.FireTrigger(testEntity, Trigger.Y);
        }
    }
}
