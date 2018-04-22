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

namespace NStateManager
{
    public abstract class StateConfigurationBase<T, TState, TTrigger> where TState : IComparable
    {
        protected internal Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>> AutoTransitions = new Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>>();
        protected internal Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>> Transitions = new Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>>();

        /// <summary>
        /// The state being configured.
        /// </summary>
        public TState State { get; }

        public Func<T, TState> StateAccessor { get; }
        public Action<T, TState> StateMutator { get; }

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="state">The state being configured.</param>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        protected StateConfigurationBase(TState state, Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
        {
            State = state;
            StateAccessor = stateAccessor ?? throw new ArgumentNullException(nameof(stateAccessor));
            StateMutator = stateMutator ?? throw new ArgumentNullException(nameof(stateMutator));
        }

        /// <summary>
        /// Adds an automatic (forward or back) transition to the state configuration.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="transition">The transition to add.</param>
        public void AddAutoTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition)
        {
            if (!AutoTransitions.TryGetValue(trigger, out var triggerTransitions))
            {
                triggerTransitions = new List<StateTransitionBase<T, TState, TTrigger>>();
                AutoTransitions.Add(trigger, triggerTransitions);
            }

            if (triggerTransitions.Any(t => t.Priority == transition.Priority))
            { throw new InvalidOperationException($"Auto transition for {State} state with priority {transition.Priority} already added."); }

            triggerTransitions.Add(transition);
        }

        /// <summary>
        /// Adds an allowable transition to the state configuration.
        /// </summary>
        /// <param name="trigger">Trigger to initiate the transition.</param>
        /// <param name="transition">The transition to add.</param>
        public void AddTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition)
        {
            if (!Transitions.TryGetValue(trigger, out var existingTransitions))
            { Transitions.Add(trigger, new List<StateTransitionBase<T, TState, TTrigger>> {transition}); }
            else
            {
                if (existingTransitions.Any(t => t.Priority == transition.Priority))
                { throw new InvalidOperationException($"{trigger} trigger was previously added for {State} state as priority {transition.Priority}."); }

                existingTransitions.Add(transition);
            }
        }

        protected StateTransitionResult<TState, TTrigger> FireTriggerPrim(ExecutionParameters<T, TTrigger> parameters)
        {
            StateTransitionResult<TState, TTrigger> result = null;

            if (Transitions.TryGetValue(parameters.Trigger, out var transitions))
            {
                foreach (var transition in transitions.OrderBy(t => t.Priority))
                {
                    result = transition.Execute(parameters);
                    if (result.WasTransitioned)
                    { return result; }
                }
            }

            return result;
        }
    }
}
