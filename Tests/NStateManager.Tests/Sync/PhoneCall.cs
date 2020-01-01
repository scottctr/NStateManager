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
using System;
using Xunit;

namespace TelephoneCallExample
{
    enum Trigger
    {
        CallDialed,
        CallConnected,
        LeftMessage,
        PlacedOnHold,
        TakenOffHold,
        PhoneHurledAgainstWall,
        MuteMicrophone,
        UnmuteMicrophone,
        SetVolume
    }

    public enum State
    {
        OffHook,
        Ringing,
        Connected,
        OnHold,
        PhoneDestroyed
    }

    public class Volume
    {
        public int Level { get; }

        public Volume(int level)
        {
            Level = level;
        }
    }

    public class PhoneCall
    {
        private readonly StateMachine<PhoneCall, State, Trigger> stateMachine = new NStateManager.Sync.StateMachine<PhoneCall, State, Trigger>(
            stateAccessor: call => call.State
          , stateMutator: (call, newState) => call.State = newState);

        public State State { get; set; } = State.OffHook;
        readonly string _caller;

        public PhoneCall(string caller)
        {
            _caller = caller;
            stateMachine.ConfigureState(State.OffHook)
                //TODO next line should be Ringing.Entry, but doesn't take parameters yet
               .AddTriggerAction<string>(Trigger.CallDialed, (phoneCall, callee) => OnDialed(callee))
               .AddTransition(Trigger.CallDialed, State.Ringing);

            stateMachine.ConfigureState(State.Ringing)
               .AddTransition(Trigger.CallConnected, State.Connected);

            stateMachine.ConfigureState(State.Connected)
               .AddEntryAction(_ =>
                { 
                    Console.WriteLine("Entering Connected");
                    StartCallTimer();
                })
               .AddExitAction(_ =>
                {
                    Console.WriteLine("Exiting Connected");
                    StopCallTimer();
                })
               .AddTriggerAction(Trigger.MuteMicrophone, _ => OnMute())
               .AddTriggerAction(Trigger.UnmuteMicrophone, _ => OnUnmute())
               .AddTriggerAction<Volume>(Trigger.SetVolume, (_, volume) => OnSetVolume(volume.Level))
               .AddTransition(Trigger.LeftMessage, State.OffHook)
               .AddTransition(Trigger.PlacedOnHold, State.OnHold);

            stateMachine.ConfigureState(State.OnHold)
               .AddEntryAction(_ =>
                {
                    Console.WriteLine("Entering OnHold");
                })
               .AddExitAction(_ =>
                {
                    Console.WriteLine("Exiting OnHold");
                })
               .MakeSubStateOf(stateMachine.ConfigureState(State.Connected))
               .AddTransition(Trigger.TakenOffHold, State.Connected)
               .AddTransition(Trigger.PhoneHurledAgainstWall, State.PhoneDestroyed);
        }
        void OnSetVolume(int volume)
        {
            Console.WriteLine("Volume set to " + volume + "!");
        }

        void OnUnmute()
        {
            Console.WriteLine("Microphone unmuted!");
        }

        void OnMute()
        {
            Console.WriteLine("Microphone muted!");
        }

        void OnDialed(string callee)
        {
            Console.WriteLine("[Phone Call] placed for : [{0}]", callee);
        }

        void StartCallTimer()
        {
            Console.WriteLine("[Timer:] Call started at {0}", DateTime.Now);
        }

        void StopCallTimer()
        {
            Console.WriteLine("[Timer:] Call ended at {0}", DateTime.Now);
        }

        public void Mute()
        {
            stateMachine.FireTrigger(this, Trigger.MuteMicrophone);
        }

        public void Unmute()
        {
            stateMachine.FireTrigger(this, Trigger.UnmuteMicrophone);
        }

        public void SetVolume(int volume)
        {
            //TODO consider not requiring TRequest to be a class
            stateMachine.FireTrigger(this, Trigger.SetVolume, new Volume(volume));
        }

        public void Print()
        {
            Console.WriteLine("[{1}] placed call and [Status:] {0}", State, _caller);
        }

        public void Dialed(string callee)
        {
            stateMachine.FireTrigger(this, Trigger.CallDialed, callee);
        }

        public void Connected()
        {
            stateMachine.FireTrigger(this, Trigger.CallConnected);
        }

        public void Hold()
        {
            stateMachine.FireTrigger(this, Trigger.PlacedOnHold);
        }

        public void Resume()
        {
            stateMachine.FireTrigger(this, Trigger.TakenOffHold);
        }
    }

    public class PhoneTester
    {
        [Fact]
        public void Test()
        {
            var phoneCall = new PhoneCall("Lokesh");

            phoneCall.Print();
            phoneCall.Dialed("Prameela");
            phoneCall.Print();
            phoneCall.Connected();
            phoneCall.Print();
            phoneCall.SetVolume(2);
            phoneCall.Print();
            phoneCall.Hold();
            phoneCall.Print();
            phoneCall.Mute();
            phoneCall.Print();
            phoneCall.Unmute();
            phoneCall.Print();
            phoneCall.Resume();
            phoneCall.Print();
            phoneCall.SetVolume(11);
            phoneCall.Print();
        }
    }
}