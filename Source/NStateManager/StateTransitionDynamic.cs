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
    internal class StateTransitionDynamic<T, TState, TTrigger> : StateTransitionDynamicBase<T, TState, TTrigger>
        where TState : IComparable
    {
        public Func<T, TState> StateFunc { get; }

        public StateTransitionDynamic(Func<T, TState> stateAccessor
            , Action<T, TState> stateMutator
            , TState fromState
            , Func<T, TState> stateFunc
            , string name
            , uint priority)
            : base(stateAccessor, stateMutator, fromState, name, priority)
        {
            StateFunc = stateFunc ?? throw new ArgumentNullException(nameof(stateFunc));
        }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);
            var toState = StateFunc.Invoke(parameters.Context);

            if (toState.CompareTo(startState) == 0)
            { return GetResult(parameters, currentResult, startState, wasSuccessful: false, wasCancelled: false); }

            StateMutator.Invoke(parameters.Context, toState);
            var transitionResult = GetResult(parameters, currentResult, startState, wasSuccessful: true, wasCancelled: false); 
            NotifyOfTransition(parameters.Context, transitionResult);

            return transitionResult;
        }
    }
}