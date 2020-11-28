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

namespace NStateManager.Async
{
    internal class StateTransitionAutoForwardParameterized<T, TState, TTrigger, TParam> : StateTransitionParameterized<T, TState, TTrigger, TParam>
        where TParam : class
        where TState : IComparable
    {
        private readonly IStateMachine<T, TState, TTrigger> _stateMachine;
        private readonly TState _triggerState;

        public StateTransitionAutoForwardParameterized(IStateMachine<T, TState, TTrigger> stateMachine, TState toState, TState triggerState, Func<T, TParam, CancellationToken, Task<bool>> conditionAsync, string name, uint priority)
            : base(stateMachine.StateAccessor, stateMachine.StateMutator, toState, conditionAsync, name, priority)
        {
            _stateMachine = stateMachine;
            _triggerState = triggerState;
        }

        public override async Task<StateTransitionResult<TState, TTrigger>> ExecuteAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            if (currentResult != null //Auto transitions must have a previously successful transition
                && !parameters.CancellationToken.IsCancellationRequested
                && (_triggerState.IsEqual(currentResult.CurrentState)
                 || _stateMachine.IsInState(parameters.Context, _triggerState)))
            { return await base.ExecuteAsync(parameters, currentResult); }

            return GetFreshResult(parameters
              , currentResult
              , StateAccessor(parameters.Context)
              , wasCancelled: parameters.CancellationToken.IsCancellationRequested
              , transitionDefined: true
              , conditionMet: false);
        }
    }
}