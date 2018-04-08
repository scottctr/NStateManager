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

namespace NStateManager
{
    internal static class StateTransitionFactory<T, TState, TTrigger>
        where TState : IComparable
    {
        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TState toState, Func<T, bool> condition, string name, uint priority = 1)
        {
            return new StateTransition<T, TState, TTrigger>(stateAccessor, stateMutator, toState, condition, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition<TRequest>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TState toState, Func<T, TRequest, bool> condition, string name, uint priority = 1)
            where TRequest : class
        {
            return new StateTransitionParameterized<T, TState, TTrigger, TRequest>(stateAccessor, stateMutator, toState, condition, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TState toState, Func<T, CancellationToken, Task<bool>> conditionAsync, string name, uint priority = 1)
        {
            return new StateTransitionAsync<T, TState, TTrigger>(stateAccessor, stateMutator, toState, conditionAsync, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TState> stateFunc, string name, uint priority = 1)
        {
            return new StateTransitionDynamic<T, TState, TTrigger>(stateAccessor, stateMutator, fromState, stateFunc, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, CancellationToken, Task<TState>> stateFuncAsync, string name, uint priority = 1)
        {
            return new StateTransitionDynamicAsync<T, TState, TTrigger>(stateAccessor, stateMutator, fromState, stateFuncAsync, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, TState> stateFunc, string name, uint priority = 1)
            where TParam : class
        {
            return new StateTransitionDynamicParameterized<T, TState, TTrigger, TParam>(stateAccessor, stateMutator, fromState, stateFunc, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, CancellationToken, Task<TState>> stateFuncAsync, string name, uint priority = 1)
            where TParam: class
        {
            return new StateTransitionDynamicParameterizedAsync<T, TState, TTrigger, TParam>(stateAccessor, stateMutator, fromState, stateFuncAsync, name, priority);
        }

        public static StateTransitionBase<T, TState, TTrigger> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TState toState, Func<T, TParam, CancellationToken, Task<bool>> conditionAsync, string name, uint priority = 1)
            where TParam: class
        {
            return new StateTransitionParameterizedAsync<T, TState, TTrigger, TParam>(stateAccessor, stateMutator, toState, conditionAsync, name, priority);
        }
    }
}