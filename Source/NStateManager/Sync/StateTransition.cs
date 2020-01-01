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
    internal class StateTransition<T, TState, TTrigger> : StateTransitionNonDynamic<T, TState, TTrigger>
    {
        public Func<T, bool> Condition { get; }
        public bool HasCondition { get; }

        public StateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState toState, string name, uint priority, Func<T, bool> condition = null)
            : base(stateAccessor, stateMutator, toState, name, priority)
        {
            Condition = condition;
            HasCondition = Condition != null;
        }

        public override StateTransitionResult<TState, TTrigger> Execute(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult = null)
        {
            return ExecutePrim(parameters, currentResult, !HasCondition || Condition(parameters.Context));
        }
    }
}
