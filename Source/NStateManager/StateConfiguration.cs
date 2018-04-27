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
using System.Linq;

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
        private readonly IStateMachine<T, TState, TTrigger> _stateMachine;

        private Action<T> _defaultEntryAction;
        private Action<T> _defaultExitAction;
        private Action<T> _reentryAction;
        private IStateConfigurationInternal<T, TState, TTrigger> _superState;

        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="state">The state being configured.</param>
        /// <param name="stateMachine">The state machine this configuration is associated with.</param>
        internal StateConfiguration(TState state, IStateMachine<T, TState, TTrigger> stateMachine)
            : base(state, stateMachine.StateAccessor, stateMachine.StateMutator)
        {
            _stateMachine = stateMachine;
        }

        /// <summary>
        /// Adds a transition that automatically forwards to a new state that's determined at runtime.
        /// </summary>
        /// <param name="trigger">The trigger this transition is used with.</param>
        /// <param name="function">The function to determine the next state.</param>
        /// <param name="name">The name of the transition.</param>
        /// <param name="priority">The priority of the transition.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoDynamicTransition(TTrigger trigger, Func<T, TState> function, string name = null, uint priority = 1)
        {
            var initialTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , State
              , function
              , State
              , name
              , priority);
            AddAutoTransition(trigger, initialTransition);

            return this;
        }

        /// <summary>
        /// Adds a transition that automatically forwards to a new state that's determined at runtime.
        /// </summary>
        /// <param name="trigger">The trigger this transition is used with.</param>
        /// <param name="function">The function to determine the next state.</param>
        /// <param name="name">The name of the transition.</param>
        /// <param name="priority">The priority of the transition.</param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoDynamicTransition<TRequest>(TTrigger trigger
          , Func<T, TRequest, TState> function
          , string name = null
          , uint priority = 1) 
            where TRequest : class
        {
            var initialTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , State
              , function
              , State
              , name
              , priority);
            AddAutoTransition(trigger, initialTransition);

            return this;
        }

        /// <summary>
        /// Adds a temporary transition, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="tempState">The temporary state to transition to before falling back to the current state.</param>
        /// <param name="condition"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition(TTrigger trigger, TState tempState, Func<T, bool> condition, string name = null, uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var initialTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , tempState
              , condition
              , name
              , priority);
            AddTransition(trigger, initialTransition);

            var tempStateAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , startState: State
              , triggerState: tempState
              , toState: State
              , condition: _ => true
              , name: name
              , priority: priority);
            AddOtherStateAutoTransition(tempState, trigger, tempStateAutoTransition);

            return this;
        }

        /// <summary>
        /// Adds a temporary transition with a request parameter, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="tempState">The temporary state to transition to before falling back to the current state.</param>
        /// <param name="condition"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition<TRequest>(TTrigger trigger
          , TState tempState
          , Func<T, TRequest, bool> condition
          , string name = null
          , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var initialTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , tempState
              , condition
              , name
              , priority);
            AddTransition(trigger, initialTransition);

            var otherStateTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , State
              , tempState
              , _ => true
              , State
              , name
              , priority);
            AddOtherStateAutoTransition(tempState, trigger, otherStateTransition);

            return this;
        }

        /// <summary>
        /// Adds a temporary transition based on a previous state, that returns to the previous state after all actions have been executed.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="tempState">The temporary state to transition to before falling back to the current state.</param>
        /// <param name="condition"></param>
        /// <param name="previousState"></param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoFallbackTransition(TTrigger trigger
          , TState tempState
          , TState previousState
          , Func<T, bool> condition
          , string name = null
          , uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var initialTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , startState: previousState
              , triggerState: State
              , toState: tempState
              , condition: condition
              , name: name
              , priority: priority);
            AddTransition(trigger, initialTransition);

            var otherStateAutoTransition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , startState: State
              , triggerState: tempState
              , toState: State
              , condition: _ => true
              , name: name
              , priority: priority);
            AddOtherStateAutoTransition(tempState, trigger, otherStateAutoTransition);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition(TTrigger trigger
          , TState toState
          , Func<T, bool> condition
          , string name = null
          , uint priority = 1)
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , triggerState: State
              , toState: toState
              , condition: condition
              , name: name
              , priority: priority);
            AddAutoTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines an automatic, but conditional, transition from this state to a new state.
        /// </summary>
        /// <typeparam name="TRequest">Parameter to be passed in from StateMachine.FireTrigger.</typeparam>
        /// <param name="trigger">The <see cref="TTrigger"/> to initiate this transition.</param>
        /// <param name="toState">The <see cref="TState"/> to transition to.</param>
        /// <param name="condition">The condition required to make the transition.</param>
        /// <param name="name"></param>
        /// <param name="priority"></param>
        /// <returns></returns>
        public IStateConfiguration<T, TState, TTrigger> AddAutoForwardTransition<TRequest>(TTrigger trigger
            , TState toState
            , Func<T, TRequest, bool> condition
            , string name = null
            , uint priority = 1)
            where TRequest : class
        {
            if (condition == null)
            { throw new ArgumentNullException(nameof(condition)); }

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
              , toState
              , condition
              , State
              , name
              , priority);
            AddAutoTransition(trigger, transition);

            return this;
        }

        /// <summary>
        /// Defines a state transition where the end state is defined by a function.
        /// </summary>
        /// <param name="trigger">The <see cref="TTrigger"/> to use initiate this transition.</param>
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

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
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

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
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

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
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

            var transition = StateTransitionFactory<T, TState, TTrigger>.GetStateTransition(_stateMachine
                , toState
                , condition
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
        public IStateConfiguration<T, TState, TTrigger> AddEntryAction(Action<T> action)
        {
            if (_defaultEntryAction != null)
            { throw new InvalidOperationException("The default OnEntryAction has already be set."); }

            _defaultEntryAction = action ?? throw new ArgumentNullException(nameof(action));

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
            { throw new InvalidOperationException("The ReentryAction has already be set."); }

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

        /// <summary>
        /// Adds this state as a subState to the given superState.
        /// </summary>
        /// <param name="superStateConfiguration">The superState.</param>
        public void AddSuperState(IStateConfigurationInternal<T, TState, TTrigger> superStateConfiguration)
        {
            if (IsInState(superStateConfiguration.State))
            { throw new ArgumentOutOfRangeException($"{State} is already a sub-state of {superStateConfiguration.State}."); }

            if (superStateConfiguration.IsInState(State))
            { throw new InvalidOperationException($"{superStateConfiguration.State} is already a sub-state of {State}."); }

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
            if (AutoTransitions.TryGetValue(parameters.Trigger, out var autoTransitions))
            {
                foreach (var transition in autoTransitions.OrderBy(t => t.Priority))
                {
                    var localResult = transition.Execute(parameters, currentResult);
                    if (localResult.WasTransitioned)
                    { return localResult; }
                }
            }

            //Check for a super state and just return the incoming currentResult if no successful auto transitions
            return _superState != null
                ? _superState.ExecuteAutoTransition(parameters, currentResult)
                : new StateTransitionResult<TState, TTrigger>(parameters.Trigger
                  , currentResult.CurrentState
                  , currentResult.CurrentState
                  , currentResult.CurrentState
                  , string.Empty
                  , transitionDefined: false
                  , conditionMet: false);
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

        private void AddOtherStateAutoTransition(TState otherState
          , TTrigger trigger
          , StateTransitionBase<T, TState, TTrigger> transition)
        {
            var otherStateConfig = GetTargetStateConfiguration(otherState);
            otherStateConfig.AddAutoTransition(trigger, transition);
        }

        private IStateConfigurationInternal<T, TState, TTrigger> GetTargetStateConfiguration(TState targetState)
        {
            return _stateMachine.ConfigureState(targetState) as IStateConfigurationInternal<T, TState, TTrigger>;
        }

        public StateTransitionResult<TState, TTrigger> FireTrigger(ExecutionParameters<T, TTrigger> parameters)
        {
            if (_triggerActions.TryGetValue(parameters.Trigger, out var triggerAction))
            { triggerAction.Execute(parameters); }

            var result = FireTriggerPrim(parameters);

            if (!(result?.WasTransitioned ?? false) && _superState != null)
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

        public IStateConfiguration<T, TState, TTrigger> MakeSubStateOf(IStateConfiguration<T, TState, TTrigger> superStateConfiguration)
        {
            AddSuperState(superStateConfiguration as IStateConfigurationInternal<T, TState, TTrigger>);

            return this;
        }
    }
}
