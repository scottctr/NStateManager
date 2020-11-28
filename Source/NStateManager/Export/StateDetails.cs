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

namespace NStateManager.Export
{
    public class StateDetails<TState, TTrigger> where TState : IComparable
    {
        public TState State { get; }

        public bool HasSuperState;
        public StateDetails<TState, TTrigger> SuperState { get; private set; }

        private readonly IList<StateDetails<TState, TTrigger>> _subStates = new List<StateDetails<TState, TTrigger>>();
        public IReadOnlyList<StateDetails<TState, TTrigger>> SubStates => (IReadOnlyList<StateDetails<TState, TTrigger>>) _subStates;

        private readonly IList<TransitionDetails<TState, TTrigger>> _transitionsFrom = new List<TransitionDetails<TState, TTrigger>>();
        public IReadOnlyList<TransitionDetails<TState, TTrigger>> TransitionsFrom => _transitionsFrom.ToList();

        private readonly IList<TransitionDetails<TState, TTrigger>> _transitionsTo = new List<TransitionDetails<TState, TTrigger>>();
        public IReadOnlyList<TransitionDetails<TState, TTrigger>> TransitionsTo => _transitionsTo.ToList();

        public bool IsStartingState => !_transitionsTo.Any();
        public bool IsSuperState => _subStates.Any();
        public bool IsFinalState { get; private set; }

        public StateDetails(TState state)
        {
            State = state;

            IsFinalState = true;
        }

        public StateDetails<TState, TTrigger> AddSubState(StateDetails<TState, TTrigger> subStateDetails)
        {
            if (_subStates.Contains(subStateDetails))
            { return this; }

            _subStates.Add(subStateDetails);
            subStateDetails.AddSuperState(this);

            return this;
        }

        public StateDetails<TState, TTrigger> AddSuperState(StateDetails<TState, TTrigger> superStateDetails)
        {
            if (SuperState != null)
            {
                if (SuperState != superStateDetails)
                { throw new InvalidOperationException($"State '{State}' already has a super state of '{SuperState.State}'." ); }
            }
            else
            {
                SuperState = superStateDetails;
                HasSuperState = true;

                superStateDetails.AddSubState(this);
            }

            return this;
        }

        public TransitionDetails<TState, TTrigger> CreateTransitionFrom(string name
          , TTrigger trigger
          , StateDetails<TState, TTrigger> toState = null
          , bool hasCondition = false
          , uint priority = 1
          , bool isDynamic = false)
        {
            var transition = new TransitionDetails<TState, TTrigger>(name
                , this
                , trigger
                , toState
                , hasCondition
                , priority
                , isDynamic);

            addTransition(transition);

            return transition;
        }

        public TransitionDetails<TState, TTrigger> CreateTransitionTo(string name
          , StateDetails<TState, TTrigger> fromState
          , TTrigger trigger
          , bool hasCondition = false
          , uint priority = 1
          , bool isDynamic = false)
        {
            var transition = new TransitionDetails<TState, TTrigger>(name
                , fromState
                , trigger
                , this
                , hasCondition
                , priority
                , isDynamic);

            addTransition(transition);

            return transition;
        }

        private void addTransition(TransitionDetails<TState, TTrigger> transition)
        {
            if (transition.FromState.State.IsEqual(State))
            {
                if (_transitionsFrom.Contains(transition))
                { return; }

                _transitionsFrom.Add(transition);
                IsFinalState = false;

                if (!transition.IsDynamic)
                { transition.ToState.addTransition(transition); }
            }
            else
            {
                if (_transitionsTo.Contains(transition))
                { return; }

                _transitionsTo.Add(transition);

                transition.FromState.addTransition(transition);
            }
        }
    }
}
