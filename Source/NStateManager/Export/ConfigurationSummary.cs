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
using System.Collections.Generic;
using System.Linq;

namespace NStateManager.Export
{
    public class ConfigurationSummary<TState, TTrigger> where TState : IComparable
    {
        private readonly Dictionary<TState, StateDetails<TState, TTrigger>> _stateDetails = new Dictionary<TState, StateDetails<TState, TTrigger>>();
        public IReadOnlyList<StateDetails<TState, TTrigger>> StateDetails => _stateDetails.Values.ToList();

        public IReadOnlyList<StateDetails<TState, TTrigger>> FinalStates => Transitions
           .Where(t => t.ToState.IsFinalState)
           .Select(t => t.ToState)
           .Distinct()
           .ToList();

        public bool HasSubStates => StateDetails.Any(s => s.IsSuperState);
            
        public IReadOnlyList<StateDetails<TState, TTrigger>> StartingStates => Transitions
           .Where(t => t.FromState.IsStartingState)
           .Select(t => t.FromState)
           .Distinct()
           .ToList();

        public IReadOnlyList<TransitionDetails<TState, TTrigger>> Transitions => _stateDetails.SelectMany(s => s.Value.TransitionsFrom).Distinct().ToList();

        public StateDetails<TState, TTrigger> AddState(TState state)
        {
            if (!_stateDetails.ContainsKey(state))
            { _stateDetails.Add(state, new StateDetails<TState, TTrigger>(state)); }

            return _stateDetails[state];
        }
    }
}
