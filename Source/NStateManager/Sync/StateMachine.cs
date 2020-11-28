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

namespace NStateManager.Sync
{
    /// <summary>
    /// Defines state transitions for a given type.
    /// </summary>
    /// <typeparam name="T">The type of object to manage state for.</typeparam>
    /// <typeparam name="TState">An allowable state for T.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger that affects objects of type T.</typeparam>
    public sealed partial class StateMachine<T, TState, TTrigger> : IStateMachine<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Dictionary<TState, IStateConfigurationInternal<T, TState, TTrigger>> _stateConfigurations =
            new Dictionary<TState, IStateConfigurationInternal<T, TState, TTrigger>>();
        private readonly Dictionary<TTrigger, TriggerActionBase<T, TTrigger>> _triggerActions =
            new Dictionary<TTrigger, TriggerActionBase<T, TTrigger>>();

        public Func<T, TState> StateAccessor { get; }
        public Action<T, TState> StateMutator { get; }

        /// <summary>
        /// Event raised when the context transitions to a new state when FireTrigger is called.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnTransition;

        /// <summary>
        /// Event raised when the context doesn't transition to a new state when FireTrigger is called.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnNoTransition;

        /// <summary>
        /// Event raised when the context's current state isn't configured for the trigger passed to FireTrigger.
        /// </summary>
        public event EventHandler<TransitionEventArgs<T, TState, TTrigger>> OnTriggerNotConfigured;

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        public StateMachine(Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
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
        public IStateMachine<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Action<T> action)
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
        public IStateMachine<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger, Action<T, TRequest> action)
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
        public IStateConfiguration<T, TState, TTrigger> ConfigureState(TState state)
        {
            if (_stateConfigurations.TryGetValue(state, out var stateConfiguration))
            { return stateConfiguration; }

            var newState = new StateConfiguration<T, TState, TTrigger>(state, this);
            _stateConfigurations.Add(state, newState);

            return newState;
        }

        /// <summary>
        /// Executes trigger with a <see cref="TRequest"/> parameter.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occurred that may affect the state.</param>
        /// <param name="request">The details of the event that's occurring.</param>
        /// <returns></returns>
        public StateTransitionResult<TState, TTrigger> FireTrigger<TRequest>(T context, TTrigger trigger, TRequest request)
            where TRequest : class
        {
            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, request: request);
            var startState = StateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            { triggerAction.Execute(executionParameters); }

            var result = !_stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? new StateTransitionResult<TState, TTrigger>(trigger
                    , startState
                    , startState
                    , startState
                    , lastTransitionName: string.Empty
                    , transitionDefined: false)
                : stateConfiguration.FireTrigger(executionParameters);

            return executeExitAndEntryActions(executionParameters, result);
        }

        /// <summary>
        /// Executes trigger.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occurred that may affect the state.</param>
        /// <returns></returns>
        public StateTransitionResult<TState, TTrigger> FireTrigger(T context, TTrigger trigger)
        {
            var startState = StateAccessor(context);
            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            { triggerAction.Execute(executionParameters); }

            var result = !_stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? new StateTransitionResult<TState, TTrigger>(trigger
                    , startState
                    , startState
                    , startState
                    ,lastTransitionName: String.Empty
                    , transitionDefined: false)
                : stateConfiguration.FireTrigger(executionParameters);

            return executeExitAndEntryActions(executionParameters, result);
        }

        public bool IsInState(T context, TState stateToCheck)
        {
            var currentState = StateAccessor(context);

            if (stateToCheck.IsEqual(currentState))
            { return true; }

            return _stateConfigurations.TryGetValue(currentState, out var currentStateConfig) 
                   && currentStateConfig.IsSubStateOf(stateToCheck);
        }

        private StateTransitionResult<TState, TTrigger> executeExitAndEntryActions(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult)
        {
            if (currentResult.WasTransitioned && 
                !(currentResult.StartingState.IsEqual(currentResult.PreviousState) 
                  && currentResult.PreviousState.IsEqual(currentResult.CurrentState)))
            {
                _stateConfigurations.TryGetValue(currentResult.PreviousState, out var previousStateConfig);
                _stateConfigurations.TryGetValue(currentResult.CurrentState, out var newStateConfig);

                //OnExit? ...don't execute if moving to sub-state
                if (!(newStateConfig != null && newStateConfig.IsSubStateOf(currentResult.PreviousState)))
                { previousStateConfig?.ExecuteExitAction(parameters.Context, currentResult); }

                //Fire the transition event before anything else.
                OnTransition?.Invoke(this, new TransitionEventArgs<T, TState, TTrigger>(parameters, currentResult));

                if (newStateConfig != null)
                {
                    //OnEntry? ...don't execute if moving to superstate
                    if (previousStateConfig != null && !previousStateConfig.IsSubStateOf(currentResult.CurrentState))
                    { newStateConfig.ExecuteEntryAction(parameters.Context, currentResult); }

                    //Auto transitions?
                    var preAutoTransitionState = currentResult.CurrentState;
                    var autoTransitionResult = newStateConfig.ExecuteAutoTransition(parameters, currentResult);
                    if (autoTransitionResult.WasTransitioned)
                    {
                        //Merge the results
                        currentResult.PreviousState = currentResult.CurrentState;
                        currentResult.CurrentState = autoTransitionResult.CurrentState;
                        currentResult.LastTransitionName = autoTransitionResult.LastTransitionName;
                        //currentResult.WasTransitioned is already true
                    }

                    //See if we have more actions from the auto transition
                    if (!currentResult.CurrentState.IsEqual(preAutoTransitionState))
                    { currentResult = executeExitAndEntryActions(parameters, autoTransitionResult); }
                }
            }
            //Reentry?
            else if (_stateConfigurations.TryGetValue(currentResult.CurrentState, out var reenteredState))
            { reenteredState.ExecuteReentryAction(parameters.Context, currentResult); }

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
    }
}
