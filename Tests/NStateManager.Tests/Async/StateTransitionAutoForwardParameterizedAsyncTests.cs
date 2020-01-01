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
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using NStateManager.Async;
using Xunit;

namespace NStateManager.Tests.Async
{
    public class StateTransitionAutoForwardParameterizedAsyncTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_ConditionAsync_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Open
                , SaleState.ChangeDue
                , conditionAsync: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_Request_not_provided()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using (var cancelSource = new CancellationTokenSource())
            {
                var cancelToken = cancelSource.Token;
                var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: null, cancellationToken: cancelToken);

                await Assert.ThrowsAsync<ArgumentException>(async () => await sut.ExecuteAsync(executionParams, GetDummyResult()));
            }
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_Request_is_wrong_type()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using (var cancelSource = new CancellationTokenSource())
            {
                var cancelToken = cancelSource.Token;
                var executionParams = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: 1, cancellationToken: cancelToken);

                await Assert.ThrowsAsync<ArgumentException>(async () => await sut.ExecuteAsync(executionParams, GetDummyResult()));
            }
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_execute_if_cancel_requested()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , conditionAsync: (_, stringParam, cancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using (var cancelSource = new CancellationTokenSource())
            {
                var cancelToken = cancelSource.Token;
                cancelSource.Cancel();
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed", cancellationToken: cancelToken);

                var result = await sut.ExecuteAsync(parameters, GetDummyResult(wasCancelled: true));

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
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , toState: endState
                , triggerState: startState
                , conditionAsync: (_, stringParam, inCancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"), GetDummyResult());

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , endState
                , startState
                , conditionAsync: (_, stringParam, inCancelToken) => Task.FromResult(result: false)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: "notUsed"),
                new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
                  , startState
                  , startState
                  , startState
                  , "transactionName"));

            Assert.Equal(startState, sale.State);
            Assert.False(result.ConditionMet);
            Assert.False(result.WasTransitioned);
            Assert.True(result.TransitionDefined);
        }

        [Fact]
        public void ExecuteAsync_ConditionAsync_can_be_cancelled()
        {
            var stopWatch = new Stopwatch();
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoForwardParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                GetStateMachine()
                , SaleState.Complete
                , SaleState.Open
                , conditionAsync: (_, stringParam, cancellationToken) =>
                {
                    Console.WriteLine($"[{stopWatch.Elapsed}] starting transition loop...");
                    do
                    {
                        Task.Delay(millisecondsDelay: 99).Wait();
                    } while (!cancellationToken.IsCancellationRequested);

                    Console.WriteLine($"[{stopWatch.Elapsed}] completed transition loop...");

                    return Task.FromResult(!cancellationToken.IsCancellationRequested);
                }
                , name: "test"
                , priority: 1);

            using (var mutex = new Mutex(initiallyOwned: false))
            using (var cancelSource = new CancellationTokenSource())
            {
                StateTransitionResult<SaleState, SaleEvent> result = null;

                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancelSource.Token, request: "test");
                Task.Factory.StartNew(async () =>
                {
                    Console.WriteLine($"[{stopWatch.Elapsed}] execution task: started");
                    mutex.WaitOne();
                    Console.WriteLine($"[{stopWatch.Elapsed}] execution task: got mutex");
                    result = await sut.ExecuteAsync(parameters, GetDummyResult());
                    mutex.ReleaseMutex();
                    Console.WriteLine($"[{stopWatch.Elapsed}] execution task: completed execution and released mutex");
                }, TaskCreationOptions.LongRunning);

                try
                {
                    Console.WriteLine($"[{stopWatch.Elapsed}] main thread: about to wait for task.Delay...");
                    Task.Delay(2222).Wait();

                    Console.WriteLine($"[{stopWatch.Elapsed}] main thread: about to wait for mutex...");
                    cancelSource.Cancel();
                    Console.WriteLine($"[{stopWatch.Elapsed}] main thread: cancelled");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"[{stopWatch.Elapsed}] main thread: {ex}");
                    cancelSource.Cancel();
                }

                mutex.WaitOne();
                Console.WriteLine($"[{stopWatch.Elapsed}] main thread: stopped waiting");

                Assert.True(result.WasCancelled);
                Assert.Equal(startState, sale.State);
                Assert.Equal(startState, result.CurrentState);
                Assert.False(result.ConditionMet);
                Assert.True(result.TransitionDefined);
                Assert.True(result.TransitionDefined);
            }
        }

        private StateTransitionResult<SaleState, SaleEvent> GetDummyResult(bool wasCancelled = false)
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName"
              , wasCancelled: wasCancelled);
        }

        private NStateManager.Async.IStateMachineAsync<Sale, SaleState, SaleEvent> GetStateMachine()
        {
            return new NStateManager.Async.StateMachineAsync<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
