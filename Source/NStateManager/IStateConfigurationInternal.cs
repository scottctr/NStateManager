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
namespace NStateManager
{
    public interface IStateConfigurationInternal<T, TState, TTrigger> : IStateConfiguration<T, TState, TTrigger>
    {
        void AddSuperState(IStateConfigurationInternal<T, TState, TTrigger> superStateConfiguration);

        void AddTransition(TTrigger trigger, StateTransitionBase<T, TState> transition);

        StateTransitionResult<TState> ExecuteAutoTransition(ExecutionParameters<T> parameters, StateTransitionResult<TState> currentResult);
        void ExecuteEntryAction(T context, StateTransitionResult<TState> currentResult);
        void ExecuteExitAction(T context, StateTransitionResult<TState> currentResult);
        void ExecuteReentryAction(T context, StateTransitionResult<TState> currentResult);


        StateTransitionResult<TState> FireTrigger(T context, TTrigger trigger);

        StateTransitionResult<TState> FireTrigger<TRequest>(T context, TTrigger trigger, TRequest request)
            where TRequest : class;

        bool IsInState(TState state);

        /// <summary>
        /// The state being configured.
        /// </summary>
        TState State { get; }
    }
}