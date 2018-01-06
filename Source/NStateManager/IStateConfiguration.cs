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
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddDynamicTransition(TTrigger trigger, Func<T, TState> function);

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddDynamicTransition<TRequest>(TTrigger trigger, Func<T, TRequest, TState> function)
            where TRequest : class;

        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">StateFunction that must be met to complete the transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTransition(TTrigger trigger, TState toState, Func<T, bool> condition = null);

        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">Asynchronous condition that must be met to complete the transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddTransition<TRequest>(TTrigger trigger, TState toState, Func<T, TRequest, bool> condition)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoTransition(TState toState, Func<T, bool> condition = null);

        IStateConfiguration<T, TState, TTrigger> AddFallbackTransition(Func<T, bool> condition = null);


        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState, Func<T, TRequest, bool> condition = null)
            where TRequest : class;

        IStateConfiguration<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, bool> condition = null)
            where TRequest : class;

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoTransition(TState toState, Func<T, bool> condition, TState previousState);

        IStateConfiguration<T, TState, TTrigger> AddFallbackTransition(Func<T, bool> condition, TState previousState);

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState, Func<T, TRequest, bool> condition, TState previousState)
            where TRequest : class;

        IStateConfiguration<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, bool> condition, TState previousState)
            where TRequest : class;

        /// <summary>
        /// Defines an action to execute when entering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action);

        /// <summary>
        /// Defines an action to execute when reentering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        IStateConfiguration<T, TState, TTrigger> AddReentryAction(Action<T> action);

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

        IStateConfiguration<T, TState, TTrigger> IsSubStateOf(IStateConfiguration<T, TState, TTrigger> superStateConfiguration);
    }
}