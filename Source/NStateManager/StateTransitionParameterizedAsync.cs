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
    internal class StateTransitionParameterizedAsync<T, TState, TParam> : StateTransitionBase<T, TState>
        where TParam : class
    {
        public Func<T, TParam, CancellationToken, Task<bool>> ConditionAsync { get; }

        public StateTransitionParameterizedAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, Func<T, TParam, CancellationToken, Task<bool>> conditionAsync)
            : base(stateAccessor, stateMutator, toState)
        {
            ConditionAsync = conditionAsync ?? throw new ArgumentNullException(nameof(conditionAsync));
        }

        public override async Task<StateTransitionResult<TState>> ExecuteAsync(ExecutionParameters<T> parameters, CancellationToken cancellationToken)
        {
            if (!(parameters.Request is TParam typeSafeParam))
            { throw new InvalidOperationException($"Expected a {typeof(TParam).Name} parameter, but received a {parameters.Request.GetType().Name}."); }

            var startState = StateAccessor(parameters.Context);

            if (cancellationToken.IsCancellationRequested)
            { return new StateTransitionResult<TState>(startState, startState, startState, wasCancelled: true); }

            if (await ConditionAsync(parameters.Context, typeSafeParam, cancellationToken).ConfigureAwait(continueOnCapturedContext: false))
            {
                StateMutator(parameters.Context, ToState);
                return new StateTransitionResult<TState>(startState, startState, ToState);
            }

            return new StateTransitionResult<TState>(startState, startState, startState, conditionMet: false, wasCancelled: cancellationToken.IsCancellationRequested); 
        }
    }
}