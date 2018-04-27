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
    public interface IStateMachineAsync<T, TState, TTrigger>
        where TState : IComparable
    {
        /// <summary>
        /// Defines an action to take any time <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <remarks><see cref="StateConfiguration{T,TState,TTrigger}"/> also has trigger actions that should only occur while T is in a specific state.</remarks>
        /// <returns></returns>
        IStateMachineAsync<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Func<T, CancellationToken, Task> action);

        /// <summary>
        /// Defines an action to take any time <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <remarks><see cref="StateConfiguration{T,TState,TTrigger}"/> also has trigger actions that should only occur while T is in a specific state.</remarks>
        /// <returns></returns>
        IStateMachineAsync<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Func<T, TRequest, CancellationToken, Task> action);

        /// <summary>
        /// Configures a specified <see cref="TState"/>.
        /// </summary>
        /// <param name="state">The <see cref="TState"/> to configure.</param>
        /// <returns></returns>
        IStateConfigurationAsync<T, TState, TTrigger> ConfigureState(TState state);

        /// <summary>
        /// Executes trigger asynchronously with a <see cref="TRequest"/> parameter.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <param name="request">The details of the event that's occurring.</param>
        /// <param name="cancellationToken"><see cref="CancellationToken"/>Provides the ability to cancel an asynchronous operation.</param>
        /// <returns></returns>
        Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync<TRequest>(T context, TTrigger trigger, TRequest request, CancellationToken cancellationToken = default(CancellationToken))
            where TRequest : class;

        /// <summary>
        /// Executes trigger.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <param name="cancellationToken"><see cref="CancellationToken"/>Provides the ability to cancel an asynchronous operation.</param>
        /// <returns></returns>
        Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync(T context, TTrigger trigger, CancellationToken cancellationToken = default(CancellationToken));

        bool IsInState(T context, TState state);

        IStateMachineAsync<T, TState, TTrigger> RegisterOnTransitionedAction(Action<T, StateTransitionResult<TState, TTrigger>> onTransitionedEvent);

        Func<T, TState> StateAccessor { get; }
        Action<T, TState> StateMutator { get; }
    }
}