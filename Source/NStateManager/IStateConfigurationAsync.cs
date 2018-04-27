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
    public interface IStateConfigurationAsync<T, TState, TTrigger>
    {
        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoDynamicTransition(TTrigger trigger, Func<T, TState> function, string name = null, uint priority = 1);

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoDynamicTransition<TRequest>(TTrigger trigger, Func<T, TRequest, TState> function, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition to a temporary state and back to this current state.
        /// </summary>
        /// <param name="trigger">The event that triggers the transition.</param>
        /// <param name="tempState">The temporary state to transition to before falling back to the current state.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoFallbackTransition(TTrigger trigger, TState tempState, Func<T, CancellationToken, Task<bool>> condition, string name = null, uint priority = 1);

        /// <summary>
        /// Defines an automatic, but conditional, transition to a temporary state and back to this current state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The event that triggers the transition.</param>
        /// <param name="tempState">The temporary state to transition to before falling back to the current state.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoFallbackTransition<TRequest>(TTrigger trigger, TState tempState, Func<T, TRequest, CancellationToken, Task<bool>> condition, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The event that triggers the transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoForwardTransition<TRequest>(TTrigger trigger, TState toState, Func<T, TRequest, CancellationToken, Task<bool>> condition, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="trigger">The event that triggers the transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddAutoForwardTransition(TTrigger trigger, TState toState, Func<T, CancellationToken, Task<bool>> condition, string name = null, uint priority = 1);

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="stateFunction">The function to determine the state.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddDynamicTransition(TTrigger trigger, Func<T, TState> stateFunction, string name = null, uint priority = 1);

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="stateFunction">The function to determine the state.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddDynamicTransition<TRequest>(TTrigger trigger, Func<T, TRequest, TState> stateFunction, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an action to execute when entering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddEntryAction(Func<T, CancellationToken, Task> action);

        /// <summary>
        /// Defines an action to execute when transitioning to this state from a given state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="previousState">The previous state required to execute the action.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddEntryAction(Func<T, CancellationToken, Task> action, TState previousState);

        /// <summary>
        /// Defines an action to execute when exiting this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddExitAction(Func<T, CancellationToken, Task> action);

        /// <summary>
        /// Defines an action to execute when exiting this state and transitioning to a specified next state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="nextState">The conditional next state for this .</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddExitAction(Func<T, CancellationToken, Task> action, TState nextState);

        /// <summary>
        /// Defines an action to execute when reentering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddReentryAction(Func<T, CancellationToken, Task> action);

        /// <summary>
        /// Defines a conditional transition to apply on the given <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> on which to execute this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="conditionAsync">The asynchronous function required to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddTransition(TTrigger trigger, TState toState, Func<T, CancellationToken, Task<bool>> conditionAsync = null, string name = null, uint priority = 1);

        /// <summary>
        /// Defines a conditional transition to apply on the given <see cref="TTrigger"/>.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> on which to execute this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="conditionAsync">The asynchronous function required to complete the transition.</param>
        /// <param name="name">Name of the transition.</param>
        /// <param name="priority">Priority of this transition compared with the other transitions for this state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddTransition<TRequest>(TTrigger trigger, TState toState, Func<T, TRequest, CancellationToken, Task<bool>> conditionAsync, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Func<T, CancellationToken, Task> action);

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Func<T, TRequest, CancellationToken, Task> action);

        /// <summary>
        /// Returns true if the given state is the same as the current state or the current state is a subset of the given state; otherwise false.
        /// </summary>
        /// <param name="state">The state to compare against.</param>
        /// <returns></returns>
        bool IsInState(TState state);

        /// <summary>
        /// Makes the current state a sub state of the given super state.
        /// </summary>
        /// <param name="superStateConfiguration">The super state.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> MakeSubStateOf(IStateConfigurationAsync<T, TState, TTrigger> superStateConfiguration);
    }
}