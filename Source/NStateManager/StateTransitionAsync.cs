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
using System.Threading;
using System.Threading.Tasks;

namespace NStateManager
{
    internal class StateTransitionAsync<T, TState, TTrigger> : StateTransitionBase<T, TState, TTrigger>
    {
        public Func<T, CancellationToken, Task<bool>> ConditionAsync { get; }

        public StateTransitionAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, Func<T, CancellationToken, Task<bool>> conditionAsync, string name, uint priority)
            : base(stateAccessor, stateMutator, toState, name, priority)
        {
            ConditionAsync = conditionAsync ?? throw new ArgumentNullException(nameof(conditionAsync));
        }

        public override async Task<StateTransitionResult<TState>> ExecuteAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState> currentResult = null)
        {
            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);

            if (parameters.CancellationToken.IsCancellationRequested)
            {
                return new StateTransitionResult<TState>(startState
                  , currentResult == null ? startState : currentResult.PreviousState
                  , currentResult == null ? startState : currentResult.CurrentState
                  , currentResult == null ? string.Empty : currentResult.LastTransitionName
                  , wasCancelled: true);
            }

            if (!await ConditionAsync(parameters.Context, parameters.CancellationToken)
               .ConfigureAwait(continueOnCapturedContext: false))
            {
                return new StateTransitionResult<TState>(startState
                  , currentResult == null ? startState : currentResult.PreviousState
                  , currentResult == null ? startState : currentResult.CurrentState
                  , currentResult == null ? string.Empty : currentResult.LastTransitionName
                  , conditionMet: false
                  , wasCancelled: parameters.CancellationToken.IsCancellationRequested);
            }

            StateMutator(parameters.Context, ToState);
            var transitionResult = currentResult == null
                ? new StateTransitionResult<TState>(startState, startState, ToState, Name)
                : new StateTransitionResult<TState>(startState, currentResult.CurrentState, ToState, Name);
            NotifyOfTransition(parameters.Context, transitionResult);

            return transitionResult;
        }
    }
}