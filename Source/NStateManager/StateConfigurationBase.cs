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
using System.Threading.Tasks;

namespace NStateManager
{
    public abstract class StateConfigurationBase<T, TState, TTrigger> where TState : IComparable
    {
        public Func<T, TState> StateAccessor { get; }
        public Action<T, TState> StateMutator { get; }
        protected Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>> AllowedTransitions = new Dictionary<TTrigger, List<StateTransitionBase<T, TState, TTrigger>>>();
        protected Dictionary<TState, StateTransitionBase<T, TState, TTrigger>> PreviousStateAutoTransitions = new Dictionary<TState, StateTransitionBase<T, TState, TTrigger>>();
        protected StateTransitionBase<T, TState, TTrigger> DefaultAutoTransition;

        /// <summary>
        /// The state being configured.
        /// </summary>
        public TState State { get; }

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="state">The state being configured.</param>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        internal StateConfigurationBase(TState state, Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
        {
            State = state;
            StateAccessor = stateAccessor ?? throw new ArgumentNullException(nameof(stateAccessor));
            StateMutator = stateMutator ?? throw new ArgumentNullException(nameof(stateMutator));
        }

        public void AddTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition)
        {
            if (!AllowedTransitions.TryGetValue(trigger, out var existingTransitions))
            { AllowedTransitions.Add(trigger, new List<StateTransitionBase<T, TState, TTrigger>> {transition}); }
            else
            {
                if (existingTransitions.Any(t => t.Priority == transition.Priority))
                { throw new InvalidOperationException($"{trigger} trigger was previously added for {State} state as priority {transition.Priority}."); }

                existingTransitions.Add(transition);
            }
        }

        protected StateTransitionResult<TState> FireTriggerPrim(ExecutionParameters<T, TTrigger> parameters)
        {
            StateTransitionResult<TState> result = null;

            if (AllowedTransitions.TryGetValue(parameters.Trigger, out var transitions))
            {
                foreach (var transition in transitions.OrderBy(t => t.Priority))
                {
                    result = transition.Execute(parameters);
                    if (result.WasSuccessful)
                    { return result; }
                }
            }

            return result;
        }

        public async Task<StateTransitionResult<TState>> FireTriggerPrimAsync(ExecutionParameters<T, TTrigger> parameters)
        {
            StateTransitionResult<TState> result = null;

            if (AllowedTransitions.TryGetValue(parameters.Trigger, out var transitions))
            {
                foreach (var transition in transitions.OrderBy(t => t.Priority))
                {
                    result = await transition.ExecuteAsync(parameters).ConfigureAwait(continueOnCapturedContext: false);
                    if (result.WasSuccessful)
                    { return result; }
                }
            }

            return result;
        }
    }
}
