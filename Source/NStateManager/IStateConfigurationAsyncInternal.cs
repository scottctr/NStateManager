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
using System.Threading;
using System.Threading.Tasks;

namespace NStateManager
{
    public interface IStateConfigurationAsyncInternal<T, TState, TTrigger> : IStateConfigurationAsync<T, TState, TTrigger>
    {
        void AddSuperState(IStateConfigurationAsyncInternal<T, TState, TTrigger> superStateConfiguration);

        void AddTransition(TTrigger trigger, StateTransitionBase<T, TState> transition);

        Task<StateTransitionResult<TState>> ExecuteAutoTransitionAsync(ExecutionParameters<T> parameters, StateTransitionResult<TState> currentResult, CancellationToken cancellationToken);
        Task ExecuteEntryActionAsync(T context, StateTransitionResult<TState> currentResult, CancellationToken cancellationToken);
        Task ExecuteExitActionAsync(T context, StateTransitionResult<TState> currentResult, CancellationToken cancellationToken);

        Task ExecuteReentryActionAsync(T context, StateTransitionResult<TState> currentResult, CancellationToken cancellationToken);
        Task<StateTransitionResult<TState>> FireTriggerAsync(T context, TTrigger trigger, CancellationToken cancellationToken);

        Task<StateTransitionResult<TState>> FireTriggerAsync<TRequest>(T context, TTrigger trigger, TRequest request, CancellationToken cancellationToken)
            where TRequest : class;
    }
}