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
    public interface IStateMachine<T, TState, TTrigger>
    {
        IStateMachine<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Action<T> action);
        IStateMachine<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Action<T, TRequest> action);
        IStateConfiguration<T, TState, TTrigger> ConfigureState(TState state);
        StateTransitionResult<TState> FireTrigger(T context, TTrigger trigger);
        StateTransitionResult<TState> FireTrigger<TRequest>(T context, TTrigger trigger, TRequest request) where TRequest : class;
        bool IsInState(T context, TState state);
        IStateMachine<T, TState, TTrigger> RegisterOnTransitionedEvent(Action<T, StateTransitionResult<TState>> onTransitionedEvent);
    }
}