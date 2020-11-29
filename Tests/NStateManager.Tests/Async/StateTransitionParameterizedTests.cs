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
using NStateManager.Async;
using System;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests.Async
{
    public class StateTransitionParameterizedTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_ConditionAsync_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Open
                , conditionAsync: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_Request_not_provided()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Complete
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using var cancelSource = new CancellationTokenSource();
            {
                var cancelToken = cancelSource.Token;
                var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: null, cancellationToken: cancelToken);

                await Assert.ThrowsAsync<ArgumentException>(async () => await sut.ExecuteAsync(executionParams));
            }
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_Request_is_wrong_type()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Complete
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using var cancelSource = new CancellationTokenSource();
            {
                var cancelToken = cancelSource.Token;
                var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: 1, cancellationToken: cancelToken);

                await Assert.ThrowsAsync<ArgumentException>(async () => await sut.ExecuteAsync(executionParams));
            }
        }

        [Fact]
        public async Task ExecuteAsync_does_not_execute_if_cancel_requested()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Complete
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using var cancelSource = new CancellationTokenSource();
            {
                var cancelToken = cancelSource.Token;
                cancelSource.Cancel();
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed", cancellationToken: cancelToken);

                var result = await sut.ExecuteAsync(parameters);

                Assert.True(result.WasCancelled);
                Assert.False(result.WasTransitioned);
                Assert.Equal(startState, sale.State);
            }
        }

        [Fact]
        public async Task ExecuteAsync_changes_state_if_condition_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: endState
                , conditionAsync: (_, stringParam, inCancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"));

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public async Task ExecuteAsync_does_not_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleId: 66) { State = startState };

            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: endState
                , conditionAsync: (_, stringParam, inCancelToken) => Task.FromResult(result: false)
                , name: "test"
                , priority: 1);

            await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"));

            Assert.Equal(startState, sale.State);
        }

        [Fact]
        public void ExecuteAsync_ConditionAsync_can_be_cancelled()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleId: 66) { State = startState };
            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: saleToUpdate => saleToUpdate.State
                , stateMutator: (saleToUpdate, newState) => saleToUpdate.State = newState
                , toState: SaleState.Complete
                , conditionAsync: (_, stringParam, cancellationToken) =>
                {
                    Task.Delay(millisecondsDelay: 999999, cancellationToken: cancellationToken);
                    return Task.FromResult(!cancellationToken.IsCancellationRequested);
                }
                , name: "test"
                , priority: 1);

            using var cancelSource = new CancellationTokenSource();
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancelSource.Token);
            Task.Run(async () => await sut.ExecuteAsync(parameters, currentResult: null));
            cancelSource.Cancel();

            Assert.Equal(startState, sale.State);
        }
    }
}
