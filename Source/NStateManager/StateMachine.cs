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

namespace NStateManager
{
    /// <summary>
    /// Defines state transitions for a given type.
    /// </summary>
    /// <typeparam name="T">The type of object to managage state for.</typeparam>
    /// <typeparam name="TState">An allowable state for T.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger that affects objects of type T.</typeparam>
    public sealed class StateMachine<T, TState, TTrigger> : IStateMachine<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Func<T, TState> _stateAccessor;
        private readonly Action<T, TState> _stateMutator;

        private readonly Dictionary<TState, IStateConfigurationInternal<T, TState, TTrigger>> _stateConfigurations =
            new Dictionary<TState, IStateConfigurationInternal<T, TState, TTrigger>>();

        private readonly Dictionary<TTrigger, TriggerActionBase<T, TTrigger>> _triggerActions =
            new Dictionary<TTrigger, TriggerActionBase<T, TTrigger>>();

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        public StateMachine(Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
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
        public IStateMachine<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger,
            Action<T, TRequest> action)
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

            var newState = new StateConfiguration<T, TState, TTrigger>(state, _stateAccessor, _stateMutator);
            _stateConfigurations.Add(state, newState);
            return newState;
        }

        /// <summary>
        /// Executes trigger with a <see cref="TRequest"/> parameter.
        /// </summary>
        /// <param name="context">The items whose state is being managed.</param>
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <param name="request">The details of the event that's occurring.</param>
        /// <returns></returns>
        public StateTransitionResult<TState> FireTrigger<TRequest>(T context, TTrigger trigger, TRequest request)
            where TRequest : class
        {
            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context, request: request);
            var startState = _stateAccessor(context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            { triggerAction.Execute(executionParameters); }

            var result = !_stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? new StateTransitionResult<TState>(startState
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
        /// <param name="trigger">The event that has occured that may affect the state.</param>
        /// <returns></returns>
        public StateTransitionResult<TState> FireTrigger(T context, TTrigger trigger)
        {
            var startState = _stateAccessor(context);
            var executionParameters = new ExecutionParameters<T, TTrigger>(trigger, context);

            if (_triggerActions.TryGetValue(trigger, out var triggerAction))
            { triggerAction.Execute(executionParameters); }

            var result = !_stateConfigurations.TryGetValue(startState, out var stateConfiguration)
                ? new StateTransitionResult<TState>(startState
                    , startState
                    , startState
                    ,lastTransitionName: String.Empty
                    , transitionDefined: false)
                : stateConfiguration.FireTrigger(executionParameters);

            return executeExitAndEntryActions(executionParameters, result);
        }

        public bool IsInState(T context, TState state)
        {
            var objectState = _stateAccessor(context);

            if (state.CompareTo(objectState) == 0)
            { return true; }

            return _stateConfigurations.TryGetValue(objectState, out var objectStateConfiguration) 
                   && objectStateConfiguration.IsInState(state);
        }

        public IStateMachine<T, TState, TTrigger> RegisterOnTransitionedEvent(Action<T, StateTransitionResult<TState>> onTransitionedEvent)
        {
            StateTransitionBase<T, TState, TTrigger>.OnTransitionedEvent += onTransitionedEvent;

            return this;
        }

        private StateTransitionResult<TState> executeExitAndEntryActions(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState> currentResult)
        {
            if (currentResult.WasSuccessful && 
                !(currentResult.StartingState.CompareTo(currentResult.PreviousState) == 0 && currentResult.PreviousState.CompareTo(currentResult.CurrentState) == 0))
            {
                //OnExit?
                if (_stateConfigurations.TryGetValue(currentResult.PreviousState, out var previousState))
                {  previousState.ExecuteExitAction(parameters.Context, currentResult); }

                if (_stateConfigurations.TryGetValue(currentResult.CurrentState, out var newState))
                {
                    //OnEntry?
                    newState.ExecuteEntryAction(parameters.Context, currentResult);

                    //AutoForward?
                    var preAutoForwardState = currentResult.CurrentState;
                    currentResult = newState.ExecuteAutoTransition(parameters, currentResult) ?? currentResult;

                    //See if we have more actions from the auto transition
                    if (currentResult.CurrentState.CompareTo(preAutoForwardState) != 0)
                    { currentResult = executeExitAndEntryActions(parameters, currentResult); }
                }
            }
            //Reentry?
            else if (_stateConfigurations.TryGetValue(currentResult.CurrentState, out var reenteredState))
            { reenteredState.ExecuteReentryAction(parameters.Context, currentResult); }

            return currentResult;
        }
    }
}
