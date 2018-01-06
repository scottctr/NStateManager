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
    internal class StateTransitionFactory<T, TState, TTrigger>
        where TState : IComparable
    {
        public static StateTransitionBase<T, TState> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TTrigger trigger, TState toState, Func<T, bool> condition)
        {
            return new StateTransition<T, TState>(stateAccessor, stateMutator, toState, condition);
        }

        public static StateTransitionBase<T, TState> GetStateTransition<TRequest>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TTrigger trigger, TState toState, Func<T, TRequest, bool> condition)
            where TRequest : class
        {
            return new StateTransitionParameterized<T, TState, TTrigger, TRequest>(stateAccessor, stateMutator, toState, condition);
        }

        public static StateTransitionBase<T, TState> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TTrigger trigger, TState toState, Func<T, CancellationToken, Task<bool>> conditionAsync)
        {
            return new StateTransitionAsync<T, TState>(stateAccessor, stateMutator, toState, conditionAsync);
        }

        public static StateTransitionBase<T, TState> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TTrigger trigger, Func<T, TState> condition)
        {
            return new StateTransitionDynamic<T, TState>(stateAccessor, stateMutator, fromState, condition);
        }

        public static StateTransitionBase<T, TState> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TState> condition)
        {
            return new StateTransitionDynamic<T, TState>(stateAccessor, stateMutator, fromState, condition);
        }

        public static StateTransitionBase<T, TState> GetStateTransition(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, CancellationToken, Task<TState>> conditionAsync)
        {
            return new StateTransitionDynamicAsync<T, TState>(stateAccessor, stateMutator, fromState, conditionAsync);
        }

        public static StateTransitionBase<T, TState> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, TState> condition)
            where TParam : class
        {
            return new StateTransitionDynamicParameterized<T, TState, TParam>(stateAccessor, stateMutator, fromState, condition);
        }

        public static StateTransitionBase<T, TState> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, Func<T, TParam, CancellationToken, Task<TState>> conditionAsync)
            where TParam: class
        {
            return new StateTransitionDynamicParameterizedAsync<T, TState, TParam>(stateAccessor, stateMutator, fromState, conditionAsync);
        }

        public static StateTransitionBase<T, TState> GetStateTransition<TParam>(Func<T, TState> stateAccessor, Action<T, TState> stateMutator, TState fromState, TState toState, Func<T, TParam, CancellationToken, Task<bool>> conditionAsync)
            where TParam: class
        {
            return new StateTransitionParameterizedAsync<T, TState, TParam>(stateAccessor, stateMutator, toState, conditionAsync);
        }
    }
}