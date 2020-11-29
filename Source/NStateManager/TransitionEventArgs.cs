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

namespace NStateManager
{
    public class TransitionEventArgs<T, TState, TTrigger> : EventArgs
    {
        /// <summary>
        /// Parameters used for the call to FireTrigger.
        /// </summary>
        public ExecutionParameters<T, TTrigger> Parameters { get; }

        /// <summary>
        /// Details of transitions that occurred during FireTrigger.
        /// </summary>
        public StateTransitionResult<TState, TTrigger> TransitionResult { get; }

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="parameters">Parameters used for the call to FireTrigger.</param>
        /// <param name="transitionResult">Details of transitions that occurred during FireTrigger.</param>
        public TransitionEventArgs(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> transitionResult)
        {
            Parameters = parameters ?? throw new ArgumentNullException(nameof(parameters));
            TransitionResult = transitionResult ?? throw new ArgumentNullException(nameof(transitionResult));
        }
    }
}
