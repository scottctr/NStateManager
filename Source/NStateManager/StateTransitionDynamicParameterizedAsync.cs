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
    internal class StateTransitionDynamicParameterizedAsync<T, TState, TTrigger, TParam> 
        : StateTransitionDynamicBase<T, TState, TTrigger>
        where TParam : class
        where TState : IComparable
    {
        public Func<T, TParam, CancellationToken, Task<TState>> StateFuncAsync { get; }

        public StateTransitionDynamicParameterizedAsync(Func<T, TState> stateAccessor
            , Action<T, TState> stateMutator
            , Func<T, TParam, CancellationToken, Task<TState>> stateFuncAsync
            , string name
            , uint priority)
            : base(stateAccessor, stateMutator, name, priority)
        {
            StateFuncAsync = stateFuncAsync ?? throw new ArgumentNullException(nameof(stateFuncAsync));
        }

        public override async Task<StateTransitionResult<TState, TTrigger>> ExecuteAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            if (!(parameters.Request is TParam typeSafeParam))
            { throw new ArgumentException($"Expected a {typeof(TParam).Name} parameter, but received a {parameters.Request?.GetType().Name ?? "null"}."); }

            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);

            if (parameters.CancellationToken.IsCancellationRequested)
            {
                if (currentResult != null)
                { return currentResult; }

                return new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                    , startState
                    , startState
                    , startState
                    , lastTransitionName: string.Empty
                    , wasCancelled: true);
            }

            var toState = await StateFuncAsync(parameters.Context, typeSafeParam, parameters.CancellationToken)
               .ConfigureAwait(continueOnCapturedContext: false);

            return ExecuteFinalizeAsync(parameters, currentResult, startState, toState);
        }
    }
}