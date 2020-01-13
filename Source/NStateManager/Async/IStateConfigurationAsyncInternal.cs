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
    public interface IStateConfigurationAsyncInternal<T, TState, TTrigger> : IStateConfigurationAsync<T, TState, TTrigger>
    {
        void AddAutoTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition);
        void AddSuperstate(IStateConfigurationAsyncInternal<T, TState, TTrigger> superStateConfiguration);
        void AddTransition(TTrigger trigger, StateTransitionBase<T, TState, TTrigger> transition);
        Task<StateTransitionResult<TState, TTrigger>> ExecuteAutoTransitionAsync(ExecutionParameters<T, TTrigger> parameters
          , StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteEntryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteExitActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task ExecuteReentryActionAsync(ExecutionParameters<T, TTrigger> parameters, StateTransitionResult<TState, TTrigger> currentResult);
        Task<StateTransitionResult<TState, TTrigger>> FireTriggerAsync(ExecutionParameters<T, TTrigger> parameters);
        TState State { get; }
    }
}