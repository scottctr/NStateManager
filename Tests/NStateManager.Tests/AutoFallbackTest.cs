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
using System.Diagnostics;
using System.Threading.Tasks;
using NStateManager.Sync;
using Xunit;
using Xunit.Abstractions;

namespace NStateManager.Tests
{
    public enum GameManEvent { Walk, Run, SeePuddle, EnergyBlast }
    public enum GameManState { Walking, Running, Jumping, Exhausted }

    public class GameMan
    {
        public GameManState State { get; set; }
    }

    public class AutoFallbackTest
    {
        private readonly ITestOutputHelper _testOutputHelper;

        public AutoFallbackTest(ITestOutputHelper testOutputHelper)
        {
            _testOutputHelper = testOutputHelper;
        }

        [Fact]
        public void RunWalkJumpTest()
        {
            var stopWatch = new Stopwatch();

            var stateMachine = new StateMachine<GameMan, GameManState, GameManEvent>(
                stateAccessor: man => man.State
              , stateMutator: (man, updatedState) => man.State = updatedState);

            stateMachine.ConfigureState(GameManState.Walking)
               .AddTransition(GameManEvent.Run, GameManState.Running)
               .AddAutoFallbackTransition(GameManEvent.SeePuddle, GameManState.Jumping, _ => true)
               .AddEntryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Start Walking"))
               .AddExitAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Exiting walking"))
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to walk"));

            stateMachine.ConfigureState(GameManState.Running)
               .AddAutoFallbackTransition(GameManEvent.SeePuddle, GameManState.Jumping, _ => true, priority: 2)
               .AddEntryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Start Running"))
               .AddExitAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Exiting running"))
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to run"));

            stateMachine.ConfigureState(GameManState.Jumping)
               .AddEntryAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] starting jump...");
                    Task.Delay(millisecondsDelay: 3000).Wait();
                })
               .AddExitAction(man => { _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] jump done."); });

            stopWatch.Start();
            var gameMan = new GameMan { State = GameManState.Walking };

            stateMachine.FireTrigger(gameMan, GameManEvent.Walk);
            stateMachine.FireTrigger(gameMan, GameManEvent.SeePuddle);
            stateMachine.FireTrigger(gameMan, GameManEvent.Run);
            stateMachine.FireTrigger(gameMan, GameManEvent.SeePuddle);
        }

        [Fact]
        public void TestAutoFallback()
        {
            var stopWatch = new Stopwatch();

            var stateMachine = new StateMachine<GameMan, GameManState, GameManEvent>(
                stateAccessor: man => man.State
              , stateMutator: (man, updatedState) => man.State = updatedState);

            stateMachine.ConfigureState(GameManState.Walking)
               .AddAutoFallbackTransition(GameManEvent.SeePuddle, GameManState.Jumping, _ => true)
               //.AddTransition(GameManEvent.SeePuddle, GameManState.Jumping)
               .AddEntryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Start Walking"))
               .AddExitAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Exiting walking"))
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to walk"));

            stateMachine.ConfigureState(GameManState.Jumping)
               .AddEntryAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] starting jump...");
                    Task.Delay(millisecondsDelay: 3000).Wait();
                })
               .AddExitAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] jump done.");
                });

            stopWatch.Start();

            var gameMan = new GameMan();
            var result = stateMachine.FireTrigger(gameMan, GameManEvent.Walk);
            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] After walk: last transition = {result.LastTransitionName}");

            result = stateMachine.FireTrigger(gameMan, GameManEvent.SeePuddle);
            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] After SeePuddle: last transition = {result.LastTransitionName}");

            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] TEST COMPLETE");
        }

        [Fact]
        public void TestAutoForward()
        {
            var stopWatch = new Stopwatch();

            var stateMachine = new StateMachine<GameMan, GameManState, GameManEvent>(
                stateAccessor: man => man.State
              , stateMutator: (man, updatedState) => man.State = updatedState);

            stateMachine.ConfigureState(GameManState.Running)
               .AddTransition(GameManEvent.SeePuddle, GameManState.Jumping)
               .AddEntryAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] starting run...");
                    Task.Delay(millisecondsDelay: 3000).Wait();
                })
               .AddExitAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] run done.");
                })
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to run"));

            stateMachine.ConfigureState(GameManState.Jumping)
               .AddAutoForwardTransition(GameManEvent.SeePuddle, GameManState.Walking, _ => true)
               .AddEntryAction(man =>
                {
                    _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] starting jump...");
                    Task.Delay(millisecondsDelay: 1000).Wait();
                })
               .AddExitAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Exiting jump"))
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to jump"));

            stateMachine.ConfigureState(GameManState.Walking)
               .AddEntryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Start Walking"))
               .AddExitAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Exiting walking"))
               .AddReentryAction(man => _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] Continuing to walk"));

            stopWatch.Start();

            var gameMan = new GameMan { State = GameManState.Running };
            var result = stateMachine.FireTrigger(gameMan, GameManEvent.Run);
            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] After run: last transition = {result.LastTransitionName}");

            result = stateMachine.FireTrigger(gameMan, GameManEvent.SeePuddle);
            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] After Seeing Puddle: last transition = {result.LastTransitionName}");

            _testOutputHelper.WriteLine($"[{stopWatch.Elapsed}] TEST COMPLETE");
        }

        enum afState { Off, On, End }
        enum afEvent { TurnOn, TurnOff, TurnOnAF }

        private class Thingy
        {
            public afState State { get; set; } = afState.Off;
        }

        [Fact]
        public void AutoForwardTest()
        {
            var stateMachine = new StateMachine<Thingy, afState, afEvent>(thingy => thingy.State
              , (thingy, updateState) => thingy.State = updateState);

            stateMachine
               .AddTriggerAction(afEvent.TurnOn, _ => _testOutputHelper.WriteLine("Firing 'On' trigger"))
               .AddTriggerAction(afEvent.TurnOnAF, _ => _testOutputHelper.WriteLine("Firing 'TurnOnAF' trigger"));
            stateMachine.OnTransition += (o, args) => _testOutputHelper.WriteLine($"Changed from {args.TransitionResult.PreviousState} to {args.TransitionResult.CurrentState} via {args.TransitionResult.LastTransitionName} transition");


            stateMachine.ConfigureState(afState.Off)
               .AddTransition(afEvent.TurnOn, afState.On, name: "On")
               .AddTransition(afEvent.TurnOnAF, afState.On, name: "OnAF");

            stateMachine.ConfigureState(afState.On)
               .AddTransition(afEvent.TurnOff, afState.Off)
               .AddAutoForwardTransition(afEvent.TurnOnAF, afState.End, _ => true, name: "AutoEnd");


            var testThingy = new Thingy();
            stateMachine.FireTrigger(testThingy, afEvent.TurnOn);
            _testOutputHelper.WriteLine("End simple On transition" + Environment.NewLine + Environment.NewLine);

            testThingy = new Thingy();
            stateMachine.FireTrigger(testThingy, afEvent.TurnOnAF);
            _testOutputHelper.WriteLine("End OnAF transition" + Environment.NewLine + Environment.NewLine);
        }
    }
}
