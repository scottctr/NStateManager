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
    public interface IStateConfiguration<T, TState, TTrigger>
    {
        /// <summary>
        /// Adds a transition to a temporary state, executes any entry or exit actions defined for the temporary state, and then falls back to the current state. 
        /// </summary>
        /// <param name="condition">Condition that must be true before executing this transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition(Func<T, bool> condition, string name = null, uint priority = 1);

        /// <summary>
        /// Adds a transition to a temporary state, executes any entry or exit actions defined for the temporary state, and then falls back to the current state. 
        /// </summary>
        /// <typeparam name="TRequest">Type to be passed as a parameter when executing this transition.</typeparam>
        /// <param name="condition">Condition that must be true before executing this transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition<TRequest>(Func<T, TRequest, bool> condition, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Adds a transition that automatically falls back to the current state after executing an action. 
        /// </summary>
        /// <param name="previousState">Conditional previous state required to execute this transition.</param>
        /// <param name="condition">Condition that must be true before executing this transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition(TState previousState, Func<T, bool> condition, string name = null, uint priority = 1);

        /// <summary>
        /// Adds a transition that automatically falls back to the current state after executing an action. 
        /// </summary>
        /// <typeparam name="TRequest">Type to be passed as a parameter when executing this transition.</typeparam>
        /// <param name="previousState">Conditional previous state required to execute this transition.</param>
        /// <param name="condition">Condition that must be true before executing this transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition<TRequest>(TState previousState, Func<T, TRequest, bool> condition, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition(TState toState, Func<T, bool> condition = null, string name = null, uint priority = 1);

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition<TRequest>(TState toState, Func<T, TRequest, bool> condition = null, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition(TState toState, Func<T, bool> condition, TState previousState, string name = null, uint priority = 1);

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition<TRequest>(TState toState, Func<T, TRequest, bool> condition, TState previousState, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddDynamicTransition(TTrigger trigger, Func<T, TState> function, string name = null, uint priority = 1);

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddDynamicTransition<TRequest>(TTrigger trigger, Func<T, TRequest, TState> function, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an action to execute when entering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action);

        /// <summary>
        /// Defines an action to execute when transitioning to this state from a given state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="previousState">The previous state required to execute the action.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action, TState previousState);

        /// <summary>
        /// Defines an action to execute when exiting this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddExitAction(Action<T> action);

        /// <summary>
        /// Defines an action to execute when exiting this state when moving to a specified state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="nextState">The conditional next state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddExitAction(Action<T> action, TState nextState);

        /// <summary>
        /// Defines an action to execute when reentering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddReentryAction(Action<T> action);

        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">StateFunction that must be met to complete the transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTransition(TTrigger trigger, TState toState, Func<T, bool> condition = null, string name = null, uint priority = 1);

        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">Asynchronous condition that must be met to complete the transition.</param>
        /// <param name="name">Optional name for this transition.</param>
        /// <param name="priority">Optional priority of this transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTransition<TRequest>(TTrigger trigger, TState toState, Func<T, TRequest, bool> condition, string name = null, uint priority = 1)
            where TRequest : class;

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Action<T> action);

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Action<T, TRequest> action);

        /// <summary>
        /// Makes the current state a substate of the specified state configuration.
        /// </summary>
        /// <param name="superStateConfiguration">The configured super state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> IsSubStateOf(IStateConfiguration<T, TState, TTrigger> superStateConfiguration);
    }
}