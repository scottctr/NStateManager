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

namespace NStateManager.Sync
{
    internal class StateTransitionParameterized<T, TState, TTrigger, TParam> : StateTransitionNonDynamic<T, TState, TTrigger>
        where TParam : class
    {
        public Func<T, TParam, bool> Condition { get; }

        public StateTransitionParameterized(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, Func<T, TParam, bool> condition, string name, uint priority)
            : base(stateAccessor, stateMutator, toState, name, priority)
        { Condition = condition ?? throw new ArgumentNullException(nameof(condition)); }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            if (!(parameters.Request is TParam typeSafeParam))
            { throw new ArgumentException($"Expected a {typeof(TParam).Name} parameter, but received a {parameters.Request?.GetType().Name ?? "null"}."); }

            return ExecutePrim(parameters, currentResult, Condition(parameters.Context, typeSafeParam));
        }
    }
}