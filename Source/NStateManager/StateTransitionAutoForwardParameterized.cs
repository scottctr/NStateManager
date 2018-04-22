﻿#region Copyright (c) 2018 Scott L. Carter
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
    internal class StateTransitionAutoForwardParameterized<T, TState, TTrigger, TParam> : StateTransitionParameterized<T, TState, TTrigger, TParam>
        where TState : IComparable
        where TParam : class
    {
        private readonly IStateMachine<T, TState, TTrigger> _stateMachine;
        private readonly TState _triggerState;

        public StateTransitionAutoForwardParameterized(IStateMachine<T, TState, TTrigger> stateMachine
          , TState triggerState
          , TState toState
          , Func<T, TParam, bool> condition
          , string name
          , uint priority)
            : base(stateMachine.StateAccessor, stateMachine.StateMutator, toState, condition, name, priority)
        {
            _stateMachine = stateMachine;
            _triggerState = triggerState;
        }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            if (!(parameters.Request is TParam))
            { throw new ArgumentException($"Expected a {typeof(TParam).Name} parameter, but received a {parameters.Request?.GetType().Name ?? "null"}."); }

            if (currentResult != null
                && (_triggerState.IsEqual(currentResult.CurrentState)
                    || _stateMachine.IsInState(parameters.Context, _triggerState)))
            { return base.Execute(parameters, currentResult); }

            return GetFreshResult(parameters
              , currentResult
              , StateAccessor(parameters.Context)
              , wasCancelled: false
              , transitionDefined: true
              , conditionMet: false);
        }
    }
}