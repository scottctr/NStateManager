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
using NStateManager.Async;
using Xunit;

namespace NStateManager.Tests.Async
{
    public class StateTransitionAutoFallbackAsyncTests
    {
        //[Fact]
        //public void Constructor_throws_ArgumentNullException_if_ConditionAsync_null()
        //{
        //    Assert.Throws<ArgumentNullException>(() => new StateTransitionAutoFallbackAsync<Sale, SaleState, SaleEvent>(
        //        GetStateMachine()
        //        , SaleState.Open
        //        , SaleState.Open
        //        , toState: SaleState.Open
        //        , conditionAsync: null
        //        , name: "test"
        //        , priority: 1));
        //}

        [Fact]
        public async Task ExecuteAsync_does_not_execute_if_CancelRequested()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoFallbackAsync<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , SaleState.Open
                , SaleState.Open
                , toState: SaleState.Complete
                , conditionAsync: (_, inCancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            using (var cancelSource = new CancellationTokenSource())
            {
                var cancelToken = cancelSource.Token;
                cancelSource.Cancel();

                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, request: null, cancellationToken: cancelToken);
                var result = await sut.ExecuteAsync(parameters, getDummyResult(wasCancelled: true));

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

            var sut = new StateTransitionAutoFallbackAsync<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , startState
                , SaleState.Open
                , toState: endState
                , conditionAsync: (_, inCancelToken) => Task.FromResult(result: true)
                , name: "test"
                , priority: 1);

            var result = await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), getDummyResult());

            Assert.True(result.WasTransitioned);
            Assert.Equal(endState, sale.State);
        }

        [Fact]
        public async Task ExecuteAsync_does_not_change_state_if_condition_not_met()
        {
            const SaleState startState = SaleState.Open;
            const SaleState endState = SaleState.Complete;
            var sale = new Sale(saleID: 66) { State = startState };

            var sut = new StateTransitionAutoFallbackAsync<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , startState
                , SaleState.Open
                , toState: endState
                , conditionAsync: (_, inCancelToken) => Task.FromResult(result: false)
                , name: "test"
                , priority: 1);

            await sut.ExecuteAsync(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale), getDummyResult());

            Assert.Equal(startState, sale.State);
        }

        [Fact]
        public void ExecuteAsync_ConditionAsync_can_be_cancelled()
        {
            const SaleState startState = SaleState.Open;
            var sale = new Sale(saleID: 66) { State = startState };
            var sut = new StateTransitionAutoFallbackAsync<Sale, SaleState, SaleEvent>(
                getStateMachine()
                , startState
                , SaleState.Open
                , toState: SaleState.Complete
                , conditionAsync: (_, cancellationToken) =>
                {
                    Task.Delay(millisecondsDelay: 999999, cancellationToken: cancellationToken);
                    return Task.FromResult(!cancellationToken.IsCancellationRequested);
                }
                , name: "test"
                , priority: 1);

            using (var cancelSource = new CancellationTokenSource())
            {
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancelSource.Token);
                Task.Run(async () => await sut.ExecuteAsync(parameters), cancelSource.Token);
                cancelSource.Cancel();

                Assert.Equal(startState, sale.State);
            }
        }

        private static StateTransitionResult<SaleState, SaleEvent> getDummyResult(bool wasCancelled = false)
        {
            return new StateTransitionResult<SaleState, SaleEvent>(SaleEvent.Pay
              , SaleState.Open
              , SaleState.Open
              , SaleState.Open
              , "transactionName"
              , wasCancelled: wasCancelled);
        }

        private static IStateMachineAsync<Sale, SaleState, SaleEvent> getStateMachine()
        {
            return new StateMachineAsync<Sale, SaleState, SaleEvent>(saleToUpdate => saleToUpdate.State
              , (saleToUpdate, newState) => saleToUpdate.State = newState);
        }
    }
}
