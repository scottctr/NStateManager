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
    /// Configuration of a specified <see cref="TState"/>.
    /// </summary>
    /// <typeparam name="T">The type of object being managed by the <see cref="StateMachine{T,TState,TTrigger}"/>.</typeparam>
    /// <typeparam name="TState">An allowable state for <see cref="T"/>.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger for changes to <see cref="T"/>.</typeparam>
    public class StateConfigurationAsync<T, TState, TTrigger>
        : StateConfigurationBase<T, TState, TTrigger>, IStateConfigurationAsyncInternal<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Dictionary<TState, Func<T, CancellationToken, Task>> _previousStateEntryActions =
            new Dictionary<TState, Func<T, CancellationToken, Task>>();

        private readonly Dictionary<TState, Func<T, CancellationToken, Task>> _nextStateExitActions =
            new Dictionary<TState, Func<T, CancellationToken, Task>>();

        private Func<T, CancellationToken, Task> _defaultEntryAction;
        private Func<T, CancellationToken, Task> _defaultExitAction;
        private Func<T, CancellationToken, Task> _reentryAction;

        private readonly Dictionary<TTrigger, FunctionActionBase<T>> _triggerActions = new Dictionary<TTrigger, FunctionActionBase<T>>();

        private IStateConfigurationAsyncInternal<T, TState, TTrigger> _superState;

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="state">The state being configured.</param>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        internal StateConfigurationAsync(TState state, Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
            : base(state, stateAccessor, stateMutator)
        { }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddAutoTransition(TState toState
          , Func<T, CancellationToken, Task<bool>> condition
          , string name = null
          , uint priority = 1)
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already been set."); }

            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , default(TTrigger)
              , toState
              , condition
              , name
              , priority);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState
          , Func<T, TRequest, CancellationToken, Task<bool>> condition
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , toState
              , condition
              , name
              , priority);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddAutoTransition(TState toState
          , Func<T, CancellationToken, Task<bool>> condition
          , TState previousState
          , string name = null
          , uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            {
                throw new InvalidOperationException(
                    $"AutoTransition already defined for {previousState}. Only one auto transition allowed per toState");
            }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , default(TTrigger)
              , toState
              , condition
              , name
              , priority);
            PreviousStateAutoTransitions.Add(previousState, transition);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="previousState">When used, this transition only applies when transitioning to this state from the specified state.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState
          , Func<T, TRequest, CancellationToken, Task<bool>> condition
          , TState previousState
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            { throw new InvalidOperationException($"AutoTransition already defined for {previousState}. Only one auto transition allowed per toState"); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , toState
              , condition
              , name
              , priority);
            PreviousStateAutoTransitions.Add(previousState, transition);

            return this;
        }

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddDynamicTransition(TTrigger trigger
            , Func<T, CancellationToken, Task<TState>> function
            , string name = null
            , uint priority = 1)
        {
            if (function == null)
            { throw new ArgumentNullException(nameof(function)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
                , StateMutator
                , State
                , function
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddDynamicTransition<TRequest>(TTrigger trigger
            , Func<T, TRequest, CancellationToken, Task<TState>> function
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (function == null)
            { throw new ArgumentNullException(nameof(function)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>
               .GetStateTransition(StateAccessor
                    , StateMutator
                    , State
                    , function
                    , name
                    , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines an action to execute when entering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddEntryAction(Func<T, CancellationToken, Task> action)
        {
            if (_defaultEntryAction != null)
            { throw new InvalidOperationException("The default OnEntryAction has already be set."); }

            _defaultEntryAction = action ?? throw new ArgumentNullException(nameof(action));

            return this;
        }

        /// <summary>
        /// Defines an action to execute when transitioning to this state from a given state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="previousState">The previous state required to execute the action.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddEntryAction(Func<T, CancellationToken, Task> action, TState previousState)
        {
            if (action == null)
            { throw new ArgumentNullException(nameof(action)); }

            if (_previousStateEntryActions.ContainsKey(previousState))
            { throw new InvalidOperationException("Only one action is allowed for each previous state."); }

            _previousStateEntryActions.Add(previousState, action);

            return this;
        }

        /// <summary>
        /// Defines an action to execute when exiting this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddExitAction(Func<T, CancellationToken, Task> action)
        {
            if (_defaultExitAction != null)
            { throw new InvalidOperationException("Default exit action already set."); }

            _defaultExitAction = action ?? throw new ArgumentNullException(nameof(action));

            return this;
        }

        /// <summary>
        /// Defines an action to execute when exiting this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddExitAction(Func<T, CancellationToken, Task> action, TState nextState)
        {
            if (action == null)
            { throw new ArgumentNullException(nameof(nextState)); }

            if (_nextStateExitActions.ContainsKey(nextState))
            { throw new InvalidOperationException($"Exit action with nextState {nextState} already set."); }

            _nextStateExitActions.Add(nextState, action);

            return this;
        }

        public IStateConfigurationAsync<T, TState, TTrigger> AddFallbackTransition(Func<T, CancellationToken, Task<bool>> condition
          , string name = null
          , uint priority = 1)
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , default(TTrigger)
              , State
              , condition
              , name
              , priority);

            return this;
        }

        public IStateConfigurationAsync<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, CancellationToken, Task<bool>> condition
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , State
              , condition
              , name
              , priority);

            return this;
        }

        public IStateConfigurationAsync<T, TState, TTrigger> AddFallbackTransition(Func<T, CancellationToken, Task<bool>> condition
          , TState previousState
          , string name = null
          , uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            { throw new InvalidOperationException($"AutoTransition already defined for {previousState}. Only one auto transition allowed per previousState"); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , default(TTrigger)
              , State
              , condition
              , name
              , priority);
            PreviousStateAutoTransitions.Add(previousState, transition);

            return this;
        }

        public IStateConfigurationAsync<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, CancellationToken, Task<bool>> condition
          , TState previousState
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            { throw new InvalidOperationException($"AutoTransition already defined for {previousState}. Only one auto transition allowed per previousState"); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , State
              , condition
              , name
              , priority);
            PreviousStateAutoTransitions.Add(previousState, transition);

            return this;
        }

        //TODO Reentry w/TRequest, but not sure how to get ref to TRequest for private variable
        /// <summary>
        /// Defines an action to execute when reentering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddReentryAction(Func<T, CancellationToken, Task> action)
        {
            if (_reentryAction != null)
            { throw new InvalidOperationException("The ReentryAction has already be set."); }

            _reentryAction = action ?? throw new ArgumentNullException(nameof(action));

            return this;
        }

        public void AddSuperState(IStateConfigurationAsyncInternal<T, TState, TTrigger> superStateConfiguration)
        {
            if (IsInState(superStateConfiguration.State))
            { throw new ArgumentOutOfRangeException($"{State} is already a sub-state of {superStateConfiguration.State}."); }

            if (superStateConfiguration.IsInState(State))
            { throw new ArgumentOutOfRangeException($"{superStateConfiguration.State} is already a sub-state of {State}."); }

            _superState = superStateConfiguration;
        }

        /// <summary>
        /// Defines a conditional transition to apply on the given <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> on which to execute this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="conditionAsync">The asynchronous function required to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddTransition(TTrigger trigger
            , TState toState
            , Func<T, CancellationToken, Task<bool>> conditionAsync = null
            , string name = null
            , uint priority = 1)
        {
            if (conditionAsync == null)
            { conditionAsync = (_, ct) => Task.FromResult(result: true); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
                , StateMutator
                , State
                , trigger
                , toState
                , conditionAsync
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines a conditional transition to apply on the given <see cref="TTrigger"/>.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> on which to execute this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="conditionAsync">The asynchronous function required to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddTransition<TRequest>(TTrigger trigger
            , TState toState
            , Func<T, TRequest, CancellationToken, Task<bool>> conditionAsync
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (conditionAsync == null)
            { throw new ArgumentNullException(nameof(conditionAsync)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
                , StateMutator
                , State
                , toState
                , conditionAsync
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /* I don't thing this is needed -- missing cancellation support
        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">StateFunction that must be met to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddTransition(TTrigger trigger
            , TState toState
            , Func<T, bool> condition = null
            , string name = null
            , uint priority = 1)
        {
            if (condition == null)
            { condition = _ => true; }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
                , StateMutator
                , State
                , trigger
                , toState
                , condition
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        } */

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Func<T, CancellationToken, Task> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for {trigger} trigger."); }

            _triggerActions.Add(trigger, TriggerActionFactory<T, TTrigger>.GetTriggerAction(action));

            return this;
        }

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfigurationAsync<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger
          , Func<T, TRequest, CancellationToken, Task> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for {trigger} trigger."); }

            _triggerActions.Add(trigger, TriggerActionFactory<T, TTrigger>.GetTriggerAction(action));

            return this;
        }

        public async Task<StateTransitionResult<TState>> ExecuteAutoTransitionAsync(ExecutionParameters<T, TTrigger> parameters
            , StateTransitionResult<TState> currentResult)
        {
            //Is there an action based on the previous state?
            if (PreviousStateAutoTransitions.TryGetValue(currentResult.PreviousState, out var action))
            { return await action.ExecuteAsync(parameters, currentResult).ConfigureAwait(continueOnCapturedContext: false); }

            //Is there an action for any entry?
            if (DefaultAutoTransition != null)
            { return await DefaultAutoTransition.ExecuteAsync(parameters, currentResult).ConfigureAwait(continueOnCapturedContext: false); }

            return _superState != null
                ? await _superState.ExecuteAutoTransitionAsync(parameters, currentResult).ConfigureAwait(continueOnCapturedContext: false)
                : new StateTransitionResult<TState>(currentResult.StartingState
                    , currentResult.PreviousState
                    , currentResult.CurrentState
                    , currentResult.LastTransitionName
                    , transitionDefined: true
                    , wasCancelled: parameters.CancellationToken.IsCancellationRequested);
        }

        public async Task ExecuteEntryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState> currentResult)
        {
            //Is there an action based on the new state?
            if (_previousStateEntryActions.TryGetValue(currentResult.PreviousState, out var action))
            {
                if (parameters.CancellationToken.IsCancellationRequested)
                { return; }

                await action.Invoke(parameters.Context, parameters.CancellationToken).ConfigureAwait(continueOnCapturedContext: false);
            }

            //Is there an action for any entry?
            if (_defaultEntryAction != null)
            {
                if (parameters.CancellationToken.IsCancellationRequested)
                { return; }

                if (_defaultEntryAction != null)
                { await _defaultEntryAction.Invoke(parameters.Context, parameters.CancellationToken).ConfigureAwait(continueOnCapturedContext: false); }
            }
        }

        public async Task ExecuteReentryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState> currentResult)
        {
            if (_superState != null)
            {
                await _superState.ExecuteReentryActionAsync(parameters, currentResult)
                    .ConfigureAwait(continueOnCapturedContext: false);
            }

            if (_reentryAction != null && !parameters.CancellationToken.IsCancellationRequested)
            {
                await _reentryAction.Invoke(parameters.Context, parameters.CancellationToken)
                    .ConfigureAwait(continueOnCapturedContext: false);
            }
        }

        public async Task ExecuteExitActionAsync(ExecutionParameters<T, TTrigger> parameters
            , StateTransitionResult<TState> currentResult)
        {
            //Is there an action based on the new state?
            if (_nextStateExitActions.TryGetValue(currentResult.CurrentState, out var action))
            {
                if (parameters.CancellationToken.IsCancellationRequested)
                { return; }

                await action.Invoke(parameters.Context, parameters.CancellationToken)
                   .ConfigureAwait(continueOnCapturedContext: false);
            }

            //Is there an action for any exit?
            if (_defaultExitAction != null)
            {
                if (parameters.CancellationToken.IsCancellationRequested)
                { return; }

                if (_defaultExitAction != null)
                {
                    await _defaultExitAction.Invoke(parameters.Context, parameters.CancellationToken)
                        .ConfigureAwait(continueOnCapturedContext: false);
                }
            }
        }

        public async Task<StateTransitionResult<TState>> FireTriggerAsync(ExecutionParameters<T, TTrigger> parameters)
        {
            if (_triggerActions.TryGetValue(parameters.Trigger, out var triggerAction))
            {
                await triggerAction.ExecuteAsync(parameters.Context, request: null, cancellationToken: parameters.CancellationToken)
                    .ConfigureAwait(continueOnCapturedContext: false);
            }

            var result = await FireTriggerPrimAsync(parameters).ConfigureAwait(continueOnCapturedContext: false);

            if (!(result?.WasSuccessful ?? false) && _superState != null)
            {
                result = await _superState.FireTriggerAsync(parameters).ConfigureAwait(continueOnCapturedContext: false);
            }
            else
            {
                var startState = StateAccessor(parameters.Context);
                result = result ?? new StateTransitionResult<TState>(startState
                             , startState
                             , startState
                             , lastTransitionName: string.Empty
                             , transitionDefined: false);
            }

            return result;
        }

        public bool IsInState(TState state)
        {
            if (state.CompareTo(State) == 0)
            { return true; }

            return _superState?.IsInState(state) ?? false;
        }
    }
}
