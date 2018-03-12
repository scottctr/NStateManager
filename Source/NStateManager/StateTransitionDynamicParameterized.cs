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
    internal class StateTransitionDynamicParameterized<T, TState, TTrigger, TParam>
        : StateTransitionDynamicBase<T, TState, TTrigger>
        where TParam : class
        where TState : IComparable
    {
        public Func<T, TParam, TState> StateFunc { get; }

        public StateTransitionDynamicParameterized(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, TState> stateFunc, string name, uint priority)
            : base(stateAccessor, stateMutator, fromState, name, priority)
        {
            StateFunc = stateFunc ?? throw new ArgumentNullException(nameof(stateFunc));
        }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            //TODO check for params.Request <> null -- ???not sure about this
            //TODO ensure params.Request is right type -- check for null

            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);
            var toState = StateFunc(parameters.Context, parameters.Request as TParam);

            var transitioned = toState.CompareTo(startState) != 0;

            if (transitioned)
            { StateMutator(parameters.Context, toState); }

            var transitionResult = (currentResult == null)
                ? new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                    , startState
                    , startState
                    , toState
                    , lastTransitionName: transitioned ? Name : string.Empty
                    , conditionMet: transitioned)
                : new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                    , startState
                    , currentResult.CurrentState
                    , toState
                    , lastTransitionName: transitioned ? Name : string.Empty
                    , conditionMet: transitioned);

            if (transitioned)
            { NotifyOfTransition(parameters.Context, transitionResult); }

            return transitionResult;
        }
    }
}