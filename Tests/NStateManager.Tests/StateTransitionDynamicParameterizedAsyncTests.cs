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
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionDynamicParameterizedAsyncTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateFuncAsync_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                    stateAccessor: sale => sale.State
                    , stateMutator: (sale, newState) => sale.State = newState
                    , stateFuncAsync: null
                    , name: "test"
                    , priority: 1));
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_parameter_wrong_type()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
              , stateMutator: (sale, newState) => sale.State = newState
              , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
              , name: "test"
              , priority: 1);

            var testSale = new Sale(saleID: 87) { State = SaleState.Open };
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: 1);

            await Assert.ThrowsAsync<ArgumentException>(async () => await sut.ExecuteAsync(parameters));
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_execute_if_already_cancelled()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token, "request");
                cancellationSource.Cancel();

                var result = await sut.ExecuteAsync(parameters);

                Assert.True(result.WasCancelled);
                Assert.Equal(SaleState.Open, sale.State);
                Assert.Equal(SaleState.Open, result.CurrentState);
            }
        }

        [Fact]
        public async Task ExecuteAsync_transitions_based_on_StateFuncAsync()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token, "request");

                var result = await sut.ExecuteAsync(parameters); 

                Assert.Equal(SaleState.Complete, sale.State);
                Assert.Equal(SaleState.Complete, result.CurrentState);
                Assert.Equal(SaleState.Open, result.PreviousState);
                Assert.False(result.WasCancelled);
            }
        }

        [Fact]
        public async Task ExecuteAsync_treats_lack_of_transitions_as_failed_condition()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Open)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token, "request");

                var result = await sut.ExecuteAsync(parameters);

                Assert.False(result.ConditionMet);
                Assert.False(result.WasTransitioned);
                Assert.False(result.WasCancelled);
                Assert.Equal(SaleState.Open, sale.State);
                Assert.Equal(SaleState.Open, result.CurrentState);
                Assert.Equal(SaleState.Open, result.PreviousState);
            }
        }

        [Fact]
        public async Task ExecuteAsync_sends_notification_if_new_state_assigned()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);
            var notificationReceived = false;
            StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token, "request");

                await sut.ExecuteAsync(parameters); 

                Assert.True(notificationReceived);
            }
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_send_notification_if_no_state_change()
        {
            var sut = new StateTransitionDynamicParameterizedAsync<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , stateFuncAsync: (sale, stringParam, cancelToken) => Task.FromResult(SaleState.Open)
                , name: "test"
                , priority: 1);
            var notificationReceived = false;
            StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token, "request");

                await sut.ExecuteAsync(parameters); 

                Assert.False(notificationReceived);
            }
        }
    }
}
