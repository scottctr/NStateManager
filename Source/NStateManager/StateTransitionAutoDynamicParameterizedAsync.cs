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
    internal class StateTransitionAutoDynamicParameterizedAsync<T, TState, TTrigger, TRequest> : StateTransitionDynamicBase<T, TState, TTrigger>
        where TState : IComparable
        where TRequest : class
    {
        private readonly IStateMachineAsync<T, TState, TTrigger> _stateMachine;
        private readonly TState _startState;
        private readonly TState _triggerState;
        private readonly Func<T, TRequest, TState> _stateFunction;

        public StateTransitionAutoDynamicParameterizedAsync(IStateMachineAsync<T, TState, TTrigger> stateMachine
          , TState startState
          , Func<T, TRequest, TState> targetStateFunction
          , TState triggerState
          , string name
          , uint priority)
            : base(stateMachine.StateAccessor, stateMachine.StateMutator, name, priority)
        {
            _stateMachine = stateMachine;
            _startState = startState;
            _triggerState = triggerState;
            _stateFunction = targetStateFunction;
        }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            if (!(parameters.Request is TRequest typeSafeParam))
            { throw new ArgumentException($"Expected a {typeof(TRequest).Name} parameter, but received a {parameters.Request?.GetType().Name ?? "null"}."); }

            if (currentResult != null
                && !parameters.CancellationToken.IsCancellationRequested
                && _startState.IsEqual(currentResult.PreviousState)
                && (_triggerState.IsEqual(currentResult.CurrentState)
                    || _stateMachine.IsInState(parameters.Context, _triggerState)))
            {
                StateMutator(parameters.Context, _stateFunction(parameters.Context, typeSafeParam));

                var transitioned = !StateAccessor(parameters.Context).IsEqual(_triggerState);
                var result = GetFreshResult(parameters
                  , currentResult
                  , currentResult.StartingState
                  , wasCancelled: false
                  , transitionDefined: true
                  , conditionMet: transitioned);
                if (transitioned)
                { NotifyOfTransition(parameters.Context, result); }

                return result;
            }

            return GetFreshResult(parameters
              , currentResult
              , StateAccessor(parameters.Context)
              , wasCancelled: parameters.CancellationToken.IsCancellationRequested
              , transitionDefined: true
              , conditionMet: false);
        }
    }
}
