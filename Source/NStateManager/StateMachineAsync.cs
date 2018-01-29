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
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace NStateManager
{
    /// <summary>
    /// Defines state transitions for a given type.
    /// </summary>
    /// <typeparam name="T">The type of object to managage state for.</typeparam>
    /// <typeparam name="TState">An allowable state for T.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger that affects objects of type T.</typeparam>
    public sealed class StateMachineAsync<T, TState, TTrigger> : IStateMachineAsync<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Func<T, TState> _stateAccessor;
        private readonly Action<T, TState> _stateMutator;
        private readonly Dictionary<TState, IStateConfigurationAsyncInternal<T, TState, TTrigger>> _stateConfigurations = new Dictionary<TState, IStateConfigurationAsyncInternal<T, TState, TTrigger>>();
        private readonly Dictionary<TTrigger, FunctionActionBase<T>> _triggerActions = new Dictionary<TTrigger, FunctionActionBase<T>>();

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        public StateMachineAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
        {
            _stateAccessor = stateAccessor ?? throw new ArgumentNullException(nameof(stateAccessor));
            _stateMutator = stateMutator ?? throw new ArgumentNullException(nameof(stateMutator));
        }

        /// <summary>
        /// Defines an action to take any time <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <remarks><see cref="StateConfiguration{T,TState,TTrigger}"/> also has trigger actions that should only occur while T is in a specific state.</remarks>
        /// <returns></returns>
        public IStateMachineAsync<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Func<T, CancellationToken, Task> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for {trigger} trigger."); }

            _triggerActions.Add(trigger, TriggerActionFactory<T, TTrigger>.GetTriggerAction(action));

            return this;
        }

        /// <summary>
        /// Defines an action to take any time <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <remarks><see cref="StateConfiguration{T,TState,TTrigger}"/> also has trigger actions that should only occur while T is in a specific state.</remarks>
        /// <returns></returns>
        public IStateMachineAsync<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Func<T, TRequest, CancellationToken, Task> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for {trigger} trigger."); }

            _triggerActions.Add(trigger, TriggerActionFactory<T, TTrigger>.GetTriggerAction(action));

            return this;
        }

        /// <summary>
        /// Configures a specified <see cref="TState"/>.
        /// </summary>
        /// <param name="state">The <see cref="TState"/> to configure.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> ConfigureState(TState state)
        {
            if (_stateConfigurations.TryGetValue(state, out var stateConfiguration))
            { return stateConfiguration; }

            var newState = new StateConfigurationAsync<T,TState, TTrigger>(state, _stateAccessor, _stateMutator);
            _stateConfigurations.Add(state, newState);

            return newState;
        }

        /// <summary>
        /// Executes trigger.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <param name="cancellationToken"><see cref="CancellationToken"/>Provides the ability to cancel an asynchronous operation.</param>
        /// <returns></returns>
        public async Task<StateTransitionResult<TState>> FireTriggerAsync(T context, TTrigger trigger, CancellationToken cancellationToken = default(CancellationToken))
        {
            var startState = _stateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            {
                await triggerAction.ExecuteAsync(context, request: null, cancellationToken: cancellationToken)
                   .ConfigureAwait(continueOnCapturedContext: false);
            }

            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, cancellationToken);

            var result = _stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? await stateConfiguration.FireTriggerAsync(executionParameters).ConfigureAwait(continueOnCapturedContext: false)
                : new StateTransitionResult<TState>(startState
                    , startState
                    , startState
                    , lastTransitionName: string.Empty
                    , transitionDefined: false);

            return await executeExitAndEntryActionsAsync(executionParameters, result).ConfigureAwait(continueOnCapturedContext: false);
        }

        /// <summary>
        /// Executes trigger asynchronously with a <see cref="TRequest"/> parameter.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <param name="request">The details of the event that's occurring.</param>
        /// <param name="cancellationToken"><see cref="CancellationToken"/>Provides the ability to cancel an asynchronous operation.</param>
        /// <returns></returns>
        public async Task<StateTransitionResult<TState>> FireTriggerAsync<TRequest>(T context
          , TTrigger trigger
          , TRequest request
          , CancellationToken cancellationToken = default(CancellationToken))
            where TRequest : class
        {
            var startState = _stateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            {
                await triggerAction.ExecuteAsync(context, cancellationToken, request)
                    .ConfigureAwait(continueOnCapturedContext: false);
            }

            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, cancellationToken, request);

            StateTransitionResult<TState> result;
            if (!_stateConfigurations.TryGetValue(startState, out var stateConfiguration))
            { result = new StateTransitionResult<TState>(startState
                , startState
                , startState
                , lastTransitionName: string.Empty
                , transitionDefined: false); }
            else
            {
                result = await stateConfiguration.FireTriggerAsync(executionParameters)
                    .ConfigureAwait(continueOnCapturedContext: false);
            }

            return await executeExitAndEntryActionsAsync(executionParameters, result)
                .ConfigureAwait(continueOnCapturedContext: false);
        }

        private async Task<StateTransitionResult<TState>> executeExitAndEntryActionsAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState> currentResult)
        {
            var currentState = _stateAccessor(parameters.Context);
            if (currentResult.WasSuccessful && !currentState.Equals(currentResult.StartingState))
            {
                //OnExit?
                if (_stateConfigurations.TryGetValue(currentResult.StartingState, out var previousState))
                {
                    await previousState.ExecuteExitActionAsync(parameters, currentResult)
                        .ConfigureAwait(continueOnCapturedContext: false);
                }

                if (_stateConfigurations.TryGetValue(currentResult.CurrentState, out var newState))
                {
                    //OnEntry?
                    await newState.ExecuteEntryActionAsync(parameters, currentResult)
                       .ConfigureAwait(continueOnCapturedContext: false);

                    //AutoForward?
                    var preAutoForwardState = currentResult.CurrentState;
                    currentResult = await newState.ExecuteAutoTransitionAsync(parameters, currentResult)
                       .ConfigureAwait(continueOnCapturedContext: false);

                    //See if we have more actions from the auto transition
                    if (preAutoForwardState.CompareTo(currentResult.CurrentState) != 0)
                    {
                        currentResult = await executeExitAndEntryActionsAsync(parameters, currentResult)
                           .ConfigureAwait(continueOnCapturedContext: false);
                    }
                }
            }
            //Reentry?
            else if (_stateConfigurations.TryGetValue(currentResult.CurrentState, out var reenteredState))
            {
                await reenteredState.ExecuteReentryActionAsync(parameters, currentResult)
                   .ConfigureAwait(continueOnCapturedContext: false);
            }

            return currentResult;
        }

        public bool IsInState(T context, TState state)
        {
            var objectState = _stateAccessor(context);

            if (state.CompareTo(objectState) == 0)
            { return true; }

            return _stateConfigurations.TryGetValue(objectState, out var objectStateConfiguration) 
                   && objectStateConfiguration.IsInState(state);
        }

        public IStateMachineAsync<T, TState, TTrigger> RegisterOnTransitionedEvent(Action<T, StateTransitionResult<TState>> onTransitionedEvent)
        {
            StateTransitionBase<T, TState, TTrigger>.OnTransitionedEvent += onTransitionedEvent;

            return this;
        }
    }
}
