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
    internal class StateTransitionParameterized<T, TState, TEvent, TParam>
        : StateTransitionBase<T, TState>
        where TParam : class
    {
        public Func<T, TParam, bool> Condition { get; }

        public StateTransitionParameterized(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, Func<T, TParam, bool> condition)
            : base(stateAccessor, stateMutator, toState)
        {
            Condition = condition ?? throw new ArgumentNullException(nameof(condition));
        }

        public override StateTransitionResult<TState> Execute(ExecutionParameters<T> parameters)
        {
            if (!(parameters.Request is TParam typeSafeParam))
            { throw new InvalidOperationException($"Expected a {typeof(TParam).Name} parameter, but received a {parameters.Request.GetType().Name}."); }

            var startState = StateAccessor(parameters.Context);

            if (Condition(parameters.Context, typeSafeParam))
            {
                StateMutator(parameters.Context, ToState);
                return new StateTransitionResult<TState>(startState, startState, ToState);
            }

            return new StateTransitionResult<TState>(startState, startState, startState, conditionMet: false); 
        }
    }
}