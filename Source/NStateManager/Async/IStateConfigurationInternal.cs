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
using System.Threading.Tasks;

namespace NStateManager.Async
{
    public interface IStateConfigurationInternal<T, TState, TTrigger> : IStateConfiguration<T, TState, TTrigger>
    {
        void AddAutoTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition);
        void AddSuperstate(IStateConfigurationInternal<T, TState, TTrigger> superStateConfiguration);
        void AddTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition);
        Task<StateTransitionResult<TState, TTrigger>> ExecuteAutoTransitionAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteEntryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteExitActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteReentryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync(ExecutionParameters<T, TTrigger> parameters);

        bool IsSubState();

        /// <summary>
        /// Returns true if the given state is the same as the current state or the current state is a subset of the given state; otherwise false.
        /// </summary>
        /// <param name="state">The state to compare against.</param>
        /// <returns></returns>
        bool IsSubStateOf(TState state);
        IStateConfigurationInternal<T, TState, TTrigger> SuperStateConfig { get; }
        TState State { get; }
    }
}