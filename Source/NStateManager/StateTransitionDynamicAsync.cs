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
    internal class StateTransitionDynamicAsync<T, TState, TTrigger> : StateTransitionDynamicBase<T, TState, TTrigger>
        where TState : IComparable
    {
        public Func<T, CancellationToken, Task<TState>> StateFunctionAsync { get; }

        public StateTransitionDynamicAsync(Func<T, TState> stateAccessor
            , Action<T, TState> stateMutator
            , TState fromState
            , Func<T, CancellationToken, Task<TState>> stateFuncAsync
            , string name
            , uint priority)
            : base(stateAccessor, stateMutator, fromState, name, priority)
        {
            StateFunctionAsync = stateFuncAsync ?? throw new ArgumentNullException(nameof(stateFuncAsync));
        }

        public override async Task<StateTransitionResult<TState, TTrigger>> ExecuteAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
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

            var toState = await StateFunctionAsync(parameters.Context, parameters.CancellationToken)
                .ConfigureAwait(continueOnCapturedContext: false);

            //If the new state matches the starting states, we treat it as if the condition wasn't met
            if (toState.CompareTo(startState) == 0)
            {
                return new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                    , startState
                    , currentResult == null ? startState : currentResult.PreviousState
                    , toState
                    , currentResult == null ? string.Empty : currentResult.LastTransitionName
                    , conditionMet: currentResult != null
                    , wasCancelled: parameters.CancellationToken.IsCancellationRequested);
            }

            StateMutator(parameters.Context, toState);
            var transitionResult = currentResult == null
                ? new StateTransitionResult<TState, TTrigger>(parameters.Trigger, startState, startState, toState, Name)
                : new StateTransitionResult<TState, TTrigger>(parameters.Trigger, startState, currentResult.CurrentState, toState, Name);
            NotifyOfTransition(parameters.Context, transitionResult);

            return transitionResult;
        }
    }
}