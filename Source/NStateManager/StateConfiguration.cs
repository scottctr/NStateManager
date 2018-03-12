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
    /// Configuration of a specified <see cref="TState"/>.
    /// </summary>
    /// <typeparam name="T">The type of object being managed by the <see cref="StateMachine{T,TState,TTrigger}"/>.</typeparam>
    /// <typeparam name="TState">An allowable state for <see cref="T"/>.</typeparam>
    /// <typeparam name="TTrigger">A recognized trigger for changes to <see cref="T"/>.</typeparam>
    public class StateConfiguration<T, TState, TTrigger> : StateConfigurationBase<T, TState, TTrigger>, IStateConfigurationInternal<T, TState, TTrigger>
        where TState : IComparable
    {
        private readonly Dictionary<TState, Action<T>> _previousStateEntryActions = new Dictionary<TState, Action<T>>();
        private readonly Dictionary<TState, Action<T>> _nextStateExitActions = new Dictionary<TState, Action<T>>();
        private readonly Dictionary<TTrigger, TriggerActionBase<T, TTrigger>> _triggerActions = new Dictionary<TTrigger, TriggerActionBase<T, TTrigger>>();

        private Action<T> _defaultEntryAction;
        private Action<T> _defaultExitAction;
        private Action<T> _reentryAction;
        private IStateConfigurationInternal<T, TState, TTrigger> _superState;

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="state">The state being configured.</param>
        /// <param name="stateAccessor">Function to retrieve the state of a <see cref="T"/>.</param>
        /// <param name="stateMutator">Action to set the state of a <see cref="T"/>.</param>
        internal StateConfiguration(TState state, Func<T, TState> stateAccessor, Action<T, TState> stateMutator)
            : base(state, stateAccessor, stateMutator)
        { }

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="function">The function to determine the state.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddDynamicTransition(TTrigger trigger
            , Func<T, TState> function
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
        public IStateConfiguration<T, TState, TTrigger> AddDynamicTransition<TRequest>(TTrigger trigger
            , Func<T, TRequest, TState> function
            , string name = null
            , uint priority = 1) 
            where TRequest : class
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
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">StateFunction that must be met to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddTransition(TTrigger trigger
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
                , toState
                , condition
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Adds a conditional transition to be applied on the specified <see cref="TTrigger"/>.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to use this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">Asynchronous condition that must be met to complete the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddTransition<TRequest>(TTrigger trigger
            , TState toState
            , Func<T, TRequest, bool> condition
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
                , StateMutator
                , State
                , toState
                , condition
                , name
                , priority);
            AddTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoTransition(TState toState
            , Func<T, bool> condition = null
            , string name = null
            , uint priority = 1)
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { condition = _ => true; }

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
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState
            , Func<T, TRequest, bool> condition = null
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { condition = (_, request) => true; }

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
        public IStateConfiguration<T, TState, TTrigger> AddAutoTransition(TState toState
            , Func<T, bool> condition
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
        public IStateConfiguration<T, TState, TTrigger> AddAutoTransition<TRequest>(TState toState
            , Func<T, TRequest, bool> condition
            , TState previousState
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            {
                throw new InvalidOperationException(
                    $"AutoTransition already defined for {previousState}. Only one auto transition allowed per previous state");
            }

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

        public IStateConfiguration<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, bool> condition
            , TState previousState
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            {
                throw new InvalidOperationException(
                    $"AutoTransition already defined for {previousState}. Only one auto transition allowed per previous state");
            }

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

        /// <summary>
        /// Defines an action to execute when entering this state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action)
        {
            if (_defaultEntryAction != null)
            { throw new InvalidOperationException("The default OnEntryAction has already be set."); }

            _defaultEntryAction = action ?? throw new ArgumentNullException(nameof(action));

            return this;
        }

        /// <summary>
        /// Adds a temporary transition, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddFallbackTransition(Func<T, bool> condition = null
          , string name = null
          , uint priority = 1)
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { condition = _ => true; }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , State
              , condition
              , name
              , priority);

            return this;
        }

        /// <summary>
        /// Adds a temporary transition with a request parameter, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddFallbackTransition<TRequest>(Func<T, TRequest, bool> condition = null
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (DefaultAutoTransition != null)
            { throw new InvalidOperationException("The default AutoTransition has already be set."); }

            if (condition == null)
            { condition = (_, request) => true; }

            DefaultAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(StateAccessor
              , StateMutator
              , State
              , State
              , condition
              , name
              , priority);

            return this;
        }

        /// <summary>
        /// Adds a temporary transition based on a previous state, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="previousState"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddFallbackTransition(Func<T, bool> condition
          , TState previousState
          , string name = null
          , uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            if (PreviousStateAutoTransitions.ContainsKey(previousState))
            { throw new InvalidOperationException($"AutoTransition already defined for {previousState}. Only one auto transition allowed per toState"); }

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
        public IStateConfiguration<T, TState, TTrigger> AddReentryAction(Action<T> action)
        {
            if (_reentryAction != null)
            {
                throw new InvalidOperationException("The ReentryAction has already be set.");
            }

            _reentryAction = action ?? throw new ArgumentNullException(nameof(action));

            return this;
        }

        /// <summary>
        /// Defines an action to execute when transitioning to this state from a given state.
        /// </summary>
        /// <param name="action">The action to execute.</param>
        /// <param name="previousState">The previous state required to execute the action.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action, TState previousState)
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
        public IStateConfiguration<T, TState, TTrigger> AddExitAction(Action<T> action)
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
        /// <param name="nextState">The conditional next <see cref="TState"/> for the exit action. The action is only executed when moving to this state.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddExitAction(Action<T> action, TState nextState)
        {
            if (action == null)
            { throw new ArgumentNullException(nameof(action));}

            if (_nextStateExitActions.ContainsKey(nextState))
            { throw new InvalidOperationException($"Exit action for next state {nextState} already set."); }

            _nextStateExitActions.Add(nextState, action);

            return this;
        }

        public void AddSuperState(IStateConfigurationInternal<T, TState, TTrigger> superStateConfiguration)
        {
            if (IsInState(superStateConfiguration.State))
            { throw new ArgumentOutOfRangeException($"{State} is already a sub-state of {superStateConfiguration.State}."); }

            if (superStateConfiguration.IsInState(State))
            { throw new ArgumentOutOfRangeException($"{superStateConfiguration.State} is already a sub-state of {State}."); }

            _superState = superStateConfiguration;
        }

        /// <summary>
        /// Defines an action to execute when a specified <see cref="TTrigger"/> occurs.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> for the action.</param>
        /// <param name="action">The action to execute.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddTriggerAction(TTrigger trigger, Action<T> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for the {trigger} trigger."); }

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
        public IStateConfiguration<T, TState, TTrigger> AddTriggerAction<TRequest>(TTrigger trigger,
            Action<T, TRequest> action)
        {
            if (_triggerActions.ContainsKey(trigger))
            { throw new InvalidOperationException($"Only one action is allowed for {trigger} trigger."); }

            _triggerActions.Add(trigger, TriggerActionFactory<T, TTrigger>.GetTriggerAction(action));

            return this;
        }

        public StateTransitionResult<TState, TTrigger> ExecuteAutoTransition(ExecutionParameters<T, TTrigger> parameters
            , StateTransitionResult<TState, TTrigger> currentResult)
        {
            //Is there an action based on the previous state?
            if (PreviousStateAutoTransitions.TryGetValue(currentResult.PreviousState, out var action))
            { return action.Execute(parameters, currentResult); }

            //Is there an action for any entry?
            if (DefaultAutoTransition != null)
            { return DefaultAutoTransition.Execute(parameters, currentResult); }

            return _superState != null
                ? _superState.ExecuteAutoTransition(parameters, currentResult)
                : new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                    , currentResult.StartingState
                    , currentResult.PreviousState
                    , currentResult.CurrentState
                    , currentResult.LastTransitionName
                    , transitionDefined: true);
        }

        public void ExecuteEntryAction(T context, StateTransitionResult<TState, TTrigger> currentResult)
        {
            //If there's an entry state for the super state, execute it first
            if (_superState != null && !IsInState(currentResult.CurrentState))
            { _superState.ExecuteEntryAction(context, currentResult); }

            //Is there an action based on the new state?
            if (_previousStateEntryActions.TryGetValue(currentResult.PreviousState, out var action))
            { action.Invoke(context); }

            //Is there an action for any entry?
            _defaultEntryAction?.Invoke(context);
        }

        public void ExecuteExitAction(T context, StateTransitionResult<TState, TTrigger> currentResult)
        {
            //Is there an action based on the new state?
            if (_nextStateExitActions.TryGetValue(currentResult.CurrentState, out var action))
            { action.Invoke(context); }

            //Is there an action for any exit?
            _defaultExitAction?.Invoke(context);

            if (_superState != null && !IsInState(currentResult.CurrentState))
            { _superState.ExecuteExitAction(context, currentResult); }
        }

        public void ExecuteReentryAction(T context, StateTransitionResult<TState, TTrigger> currentResult)
        {
            _superState?.ExecuteReentryAction(context, currentResult);

            _reentryAction?.Invoke(context);
        }

        public StateTransitionResult<TState, TTrigger> FireTrigger(ExecutionParameters<T, TTrigger> parameters)
        {
            if (_triggerActions.TryGetValue(parameters.Trigger, out var triggerAction))
            { triggerAction.Execute(parameters); }

            var result = FireTriggerPrim(parameters);

            if (!(result?.WasSuccessful ?? false) && _superState != null)
            { result = _superState.FireTrigger(parameters); }
            else
            {
                var startState = StateAccessor(parameters.Context);
                result = result ?? 
                    new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                        , startState
                        , startState
                        , startState
                        , string.Empty
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

        public IStateConfiguration<T, TState, TTrigger> IsSubStateOf(IStateConfiguration<T, TState, TTrigger> superStateConfiguration)
        {
            AddSuperState(superStateConfiguration as IStateConfigurationInternal<T, TState, TTrigger>);

            return this;
        }
    }
}
