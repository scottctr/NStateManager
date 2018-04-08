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

        public void PhoneTest()
        {
            var stateMachine = new StateMachine<Telephone, TelephoneState, TelephoneEvent>(
                stateAccessor: telephone => telephone.State
              , stateMutator: (telephone, newState) => telephone.State = newState);

            stateMachine.ConfigureState(TelephoneState.Connected)
                .AddReentryAction(telephone => telephone.MissedCalls++);
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
                .IsSubStateOf(stateMachine.ConfigureState(State.SuperState))
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
