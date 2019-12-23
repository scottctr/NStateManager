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
    public abstract class StateTransitionNonDynamic<T, TState, TTrigger> : StateTransitionBase<T, TState, TTrigger>
    {
        public TState ToState { get; protected set; }

        protected StateTransitionNonDynamic(Func<T, TState> stateAccessor
            , Action<T, TState> stateMutator
            , TState toState
            , string name
            , uint priority)
        : base(stateAccessor, stateMutator, name, priority)
        {
            ToState = toState;
        }

        protected StateTransitionResult<TState, TTrigger> ExecutePrim(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult, bool conditionMet)
        {
            var startState = currentResult != null ? currentResult.StartingState : StateAccessor(parameters.Context);

            if (!conditionMet)
            { return GetFreshResult(parameters, currentResult, startState, wasCancelled: false, conditionMet: false, transitionDefined: true); }

            StateMutator(parameters.Context, ToState);
            var transitionResult = GetFreshResult(parameters, currentResult, startState, wasCancelled: false, conditionMet: true, transitionDefined: true);

            return transitionResult;
        }
    }
}