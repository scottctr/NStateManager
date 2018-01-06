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
    internal class StateTransitionDynamic<T, TState> : StateTransitionDynamicBase<T, TState>
        where TState : IComparable
    {
        public Func<T, TState> StateFunction { get; }

        public StateTransitionDynamic(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TState> stateFunction)
            : base(stateAccessor, stateMutator, fromState)
        {
            StateFunction = stateFunction ?? throw new ArgumentNullException(nameof(stateFunction));
        }

        public override StateTransitionResult<TState> Execute(ExecutionParameters<T> parameters)
        {
            var startState = StateAccessor(parameters.Context);
            var toState = StateFunction.Invoke(parameters.Context);
            var wasSuccessfull = false;

            if (toState.CompareTo(startState) != 0)
            {
                wasSuccessfull = true;
                StateMutator.Invoke(parameters.Context, toState);
            }

            return new StateTransitionResult<TState>(startState, startState, toState, conditionMet: wasSuccessfull);
        }
    }
}