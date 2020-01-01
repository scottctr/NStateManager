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

namespace NStateManager.Export
{
    public class TransitionDetails<TState, TTrigger> where TState : IComparable
    {
        public TransitionDetails(string name
          , StateDetails<TState, TTrigger> fromState
          , TTrigger trigger
          , StateDetails<TState, TTrigger> toState = null
          , bool hasCondition = false
          , uint priority = 1
          , bool isDynamic = false)
        {
            Name = name;
            FromState = fromState;
            Trigger = trigger;
            ToState = toState;
            HasCondition = hasCondition;
            Priority = priority;
            IsDynamic = isDynamic;
        }

        public string Name { get; }
        public StateDetails<TState, TTrigger> FromState { get; }
        public TTrigger Trigger { get; }
        public StateDetails<TState, TTrigger> ToState { get; }
        public bool HasCondition { get; }
        public uint Priority { get; }
        public bool IsDynamic { get; }
    }
}
