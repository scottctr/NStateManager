using System;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionDynamicAsyncTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_StateFuncAsync_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                    stateAccessor: sale => sale.State
                    , stateMutator: (sale, newState) => sale.State = newState
                    , fromState: SaleState.ChangeDue
                    , stateFuncAsync: null
                    , name: "test"
                    , priority: 1));
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_execute_if_already_cancelled()
        {
            var sut = new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                cancellationSource.Cancel();
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancellationSource.Token);

                var result = await sut.ExecuteAsync(parameters);

                Assert.True(result.WasCancelled);
                Assert.Equal(SaleState.Open, sale.State);
                Assert.Equal(SaleState.Open, result.CurrentState);
            }
        }

        [Fact]
        public async Task ExecuteAsync_transitions_based_on_StateFuncAsync()
        {
            var sut = new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token);

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
            var sut = new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Open)
                , name: "test"
                , priority: 1);

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancellationSource.Token);

                var result = await sut.ExecuteAsync(parameters);

                Assert.False(result.ConditionMet);
                Assert.False(result.WasSuccessful);
                Assert.False(result.WasCancelled);
                Assert.Equal(SaleState.Open, sale.State);
                Assert.Equal(SaleState.Open, result.CurrentState);
                Assert.Equal(SaleState.Open, result.PreviousState);
            }
        }

        [Fact]
        public async Task ExecuteAsync_sends_notification_if_new_state_assigned()
        {
            var sut = new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Complete)
                , name: "test"
                , priority: 1);
            var notificationReceived = false;
            StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationSource.Token);

                await sut.ExecuteAsync(parameters);

                Assert.True(notificationReceived);
            }
        }

        [Fact]
        public async Task ExecuteAsync_doesnt_send_notification_if_no_state_change()
        {
            var sut = new StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , fromState: SaleState.Open
                , stateFuncAsync: (sale, cancelToken) => Task.FromResult(SaleState.Open)
                , name: "test"
                , priority: 1);
            var notificationReceived = false;
            StateTransitionDynamicAsync<Sale, SaleState, SaleEvent>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 87) { State = SaleState.Open };
                var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, sale, cancellationToken: cancellationSource.Token);

                await sut.ExecuteAsync(parameters);

                Assert.False(notificationReceived);
            }
        }
    }
}
