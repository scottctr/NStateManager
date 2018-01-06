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
    internal class StateTransitionDynamicAsync<T, TState> : StateTransitionDynamicBase<T, TState>
        where TState : IComparable
    {
        public Func<T, CancellationToken, Task<TState>> StateFunctionAsync { get; }

        public StateTransitionDynamicAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, CancellationToken, Task<TState>> conditionAsync)
            : base(stateAccessor, stateMutator, fromState)
        {
            StateFunctionAsync = conditionAsync ?? throw new ArgumentNullException(nameof(conditionAsync));
        }

        public override async Task<StateTransitionResult<TState>> ExecuteAsync(ExecutionParameters<T> parameters, CancellationToken cancellationToken)
        {
            var startState = StateAccessor(parameters.Context);

            if (cancellationToken.IsCancellationRequested)
            { return  new StateTransitionResult<TState>(startState, startState, startState, wasCancelled: true);}

            var toState = await StateFunctionAsync(parameters.Context, cancellationToken)
                .ConfigureAwait(continueOnCapturedContext: false);
            var wasSuccessfull = false;

            if (toState.CompareTo(startState) != 0)
            {
                wasSuccessfull = true;
                StateMutator(parameters.Context, toState);
            }

            return new StateTransitionResult<TState>(startState, startState, toState, conditionMet: wasSuccessfull, wasCancelled: !wasSuccessfull && cancellationToken.IsCancellationRequested);
        }
    }
}