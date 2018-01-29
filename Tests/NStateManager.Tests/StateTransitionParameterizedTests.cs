using System;
using Xunit;

namespace NStateManager.Tests
{
    public class StateTransitionParameterizedTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Condition_is_null()
        {
            Assert.Throws<ArgumentNullException>(() => new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , toState: SaleState.Complete
                , condition: null
                , name: "test"
                , priority: 1));
        }

        [Fact]
        public void Execute_throws_ArgumentException_if_parameter_wrong_type()
        {
            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , toState: SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            Assert.Throws<ArgumentException>(() => sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, new Sale(saleID: 9), request: 0)));
        }

        [Fact]
        public void Execute_transitions_if_condition_met()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.Open} ;

            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , toState: SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "yes"));

            Assert.Equal(SaleState.Complete, testSale.State);
        }

        [Fact]
        public void Execute_doesnt_transition_if_condition_not_met()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.Open };

            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , toState: SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "NO"));

            Assert.Equal(SaleState.Open, testSale.State);
        }

        [Fact]
        public void Execute_sends_notification_if_transition_successful()
        {
            var testSale = new Sale(saleID: 55) { State = SaleState.Open };

            var sut = new StateTransitionParameterized<Sale, SaleState, SaleEvent, string>(
                stateAccessor: sale => sale.State
                , stateMutator: (sale, newState) => sale.State = newState
                , toState: SaleState.Complete
                , condition: (_, parameter) => parameter == "yes"
                , name: "test"
                , priority: 1);

            var notificationReceived = false;
            StateTransitionParameterized<Sale, SaleState, SaleEvent, string>.OnTransitionedEvent += (sale, _) => notificationReceived = true;

            sut.Execute(new ExecutionParameters<Sale, SaleEvent>(SaleEvent.Pay, testSale, request: "yes"));

            Assert.True(notificationReceived);
        }
    }
}
