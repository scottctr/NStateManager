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
    internal class StateTransitionAsync<T, TState, TTrigger> : StateTransitionNonDynamic<T, TState, TTrigger>
    {
        public Func<T, CancellationToken, Task<bool>> ConditionAsync { get; }

        public StateTransitionAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, Func<T, CancellationToken, Task<bool>> conditionAsync, string name, uint priority)
            : base(stateAccessor, stateMutator, toState, name, priority)
        {
            ConditionAsync = conditionAsync ?? throw new ArgumentNullException(nameof(conditionAsync));
        }

        public override async Task<StateTransitionResult<TState, TTrigger>> ExecuteAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);

            if (parameters.CancellationToken.IsCancellationRequested)
            { return GetFreshResult(parameters, currentResult, startState, wasCancelled: true, transitionDefined: true, conditionMet: false); }

            if (!await ConditionAsync(parameters.Context, parameters.CancellationToken)
               .ConfigureAwait(continueOnCapturedContext: false))
            { return GetFreshResult(parameters, currentResult, startState, wasCancelled: parameters.CancellationToken.IsCancellationRequested, transitionDefined: true, conditionMet: false); }

            StateMutator(parameters.Context, ToState);
            var transitionResult = GetFreshResult(parameters, currentResult, startState, wasCancelled: false, conditionMet: true, transitionDefined: true); 
            NotifyOfTransition(parameters.Context, transitionResult);

            return transitionResult;
        }
    }
}