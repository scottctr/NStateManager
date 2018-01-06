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
    internal class StateTransitionDynamicParameterized<T, TState, TParam>
        : StateTransitionDynamicBase<T, TState>
        where TParam : class
        where TState : IComparable
    {
        public Func<T, TParam, TState> Condition { get; }

        public StateTransitionDynamicParameterized(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, TState> condition)
            : base(stateAccessor, stateMutator, fromState)
        {
            Condition = condition ?? throw new ArgumentNullException(nameof(condition));
        }

        public override StateTransitionResult<TState> Execute(ExecutionParameters<T> parameters)
        {
            var startState = StateAccessor(parameters.Context);
            var toState = Condition(parameters.Context, parameters.Request as TParam);
            StateMutator(parameters.Context, toState);

            return new StateTransitionResult<TState>(startState
                ,startState
                ,toState
                ,conditionMet: toState.CompareTo(startState) == 0);
        }
    }
}