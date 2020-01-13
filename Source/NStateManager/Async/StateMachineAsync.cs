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
using NStateManager.Sync;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace NStateManager.Async
{
    /// <summary>
    /// Defines state transitions for a given type.
    /// </summary>
    /// <typeparam name="T">The type of object to manage state for.</typeparam>
    /// <typeparam name="TState">An allowable state for T.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger that affects objects of type T.</typeparam>
    public sealed partial class StateMachineAsync<T, TState, TTrigger> : IStateMachineAsync<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Dictionary<TState, IStateConfigurationAsyncInternal<T, TState, TTrigger>> _stateConfigurations = new Dictionary<TState, IStateConfigurationAsyncInternal<T, TState, TTrigger>>();
        private readonly Dictionary<TTrigger, FunctionActionBase<T>> _triggerActions = new Dictionary<TTrigger, FunctionActionBase<T>>();

        public Func<T, TState> StateAccessor { get; }
        public Action<T, TState> StateMutator { get; }

        /// <summary>
        /// Event raised when the context doesn't transition to a new state when FireTrigger is called.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnTransition;

        /// <summary>
        /// Event raised when the context doesn't transition to a new state when FireTrigger is called.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnNoTransition;

        /// <summary>
        /// Event raised when the context's current state isn't configured for trigger passed to FireTrigger.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnTriggerNotConfigured;

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        public StateMachineAsync(Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
        {
            StateAccessor = stateAccessor ?? throw new ArgumentNullException(nameof(stateAccessor));
            StateMutator = stateMutator ?? throw new ArgumentNullException(nameof(stateMutator));
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

            var newState = new StateConfigurationAsync<T,TState, TTrigger>(state, this);
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
        public async Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync(T context, TTrigger trigger, CancellationToken cancellationToken = default(CancellationToken))
        {
            var startState = StateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            {
                await triggerAction.ExecuteAsync(context, request: null, cancellationToken: cancellationToken)
                   .ConfigureAwait(continueOnCapturedContext: false);
            }

            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, cancellationToken);

            var result = _stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? await stateConfiguration.FireTriggerAsync(executionParameters).ConfigureAwait(continueOnCapturedContext: false)
                : new StateTransitionResult<TState, TTrigger>(trigger
                    , startState
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
        public async Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync<TRequest>(T context
          , TTrigger trigger
          , TRequest request
          , CancellationToken cancellationToken = default(CancellationToken))
            where TRequest : class
        {
            var startState = StateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            { await triggerAction.ExecuteAsync(context, cancellationToken, request).ConfigureAwait(continueOnCapturedContext: false); }

            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, cancellationToken, request);

            StateTransitionResult<TState, TTrigger> result;
            if (!_stateConfigurations.TryGetValue(startState, out var stateConfiguration))
            { result = new StateTransitionResult<TState, TTrigger>(trigger
                , startState
                , startState
                , startState
                , lastTransitionName: string.Empty
                , transitionDefined: false); }
            else
            {
                result = await stateConfiguration.FireTriggerAsync(executionParameters).ConfigureAwait(continueOnCapturedContext: false);
            }

            return await executeExitAndEntryActionsAsync(executionParameters, result).ConfigureAwait(continueOnCapturedContext: false);
        }

        private async Task<StateTransitionResult<TState, TTrigger>> executeExitAndEntryActionsAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult)
        {
            var currentState = StateAccessor(parameters.Context);
            if (currentResult.WasTransitioned && !currentState.Equals(currentResult.StartingState))
            {
                _stateConfigurations.TryGetValue(currentResult.PreviousState, out var previousStateConfig);
                _stateConfigurations.TryGetValue(currentResult.CurrentState, out var newStateConfig);

                //OnExit? ...don't execute if moving to substate
                if (previousStateConfig != null && !(newStateConfig != null && newStateConfig.IsSubstateOf(currentResult.PreviousState)))
                {
                    await previousStateConfig.ExecuteExitActionAsync(parameters, currentResult)
                        .ConfigureAwait(continueOnCapturedContext: false);
                }

                //Fire the transition event before anything else.
                OnTransition?.Invoke(this, new TransitionEventArgs<T, TState, TTrigger>(parameters, currentResult));

                if (newStateConfig != null)
                {
                    //OnEntry? ...don't execute if moving to superstate
                    if (previousStateConfig != null && !previousStateConfig.IsSubstateOf(currentResult.CurrentState))
                    {
                        await newStateConfig.ExecuteEntryActionAsync(parameters, currentResult)
                           .ConfigureAwait(continueOnCapturedContext: false);
                    }

                    //Auto transition?
                    var preAutoTransitionState = currentResult.CurrentState;
                    var autoTransitionResult = await newStateConfig.ExecuteAutoTransitionAsync(parameters, currentResult)
                       .ConfigureAwait(continueOnCapturedContext: false);
                    if (autoTransitionResult.WasTransitioned)
                    {
                        //Merge the results
                        currentResult.PreviousState = currentResult.CurrentState;
                        currentResult.CurrentState = autoTransitionResult.CurrentState;
                        currentResult.LastTransitionName = autoTransitionResult.LastTransitionName;
                        //currentResult.WasTransitioned is already true
                    }

                    //See if we have more actions from the auto transition
                    if (!preAutoTransitionState.IsEqual(currentResult.CurrentState))
                    {
                        await executeExitAndEntryActionsAsync(parameters, autoTransitionResult)
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

            //Send non-transition events
            if (!currentResult.WasTransitioned)
            {
                var transitionEventArgs = new TransitionEventArgs<T, TState, TTrigger>(parameters, currentResult);
                if (!currentResult.TransitionDefined)
                { OnTriggerNotConfigured?.Invoke(this, transitionEventArgs); }

                OnNoTransition?.Invoke(this, transitionEventArgs);
            }

            return currentResult;
        }

        public bool IsInState(T context, TState stateToCheck)
        {
            var currentState = StateAccessor(context);

            if (stateToCheck.IsEqual(currentState))
            { return true; }

            return _stateConfigurations.TryGetValue(currentState, out var objectStateConfiguration) 
                   && objectStateConfiguration.IsSubstateOf(stateToCheck);
        }
    }
}
