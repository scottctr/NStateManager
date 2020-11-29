using NStateManager.Export;
using NStateManager.Sync;
using System;
using TelephoneCallExample;
using Xunit;

namespace NStateManager.Tests.Export
{
    public class DotGraphExporterTests
    {
        [Fact]
        public void Export_exports_phone_graph()
        {
            var stateMachine = new PhoneCall("Scott");
            var summary = stateMachine.GetSummary();
            var dotGraph = DotGraphExporter<State, Trigger>.Export(summary);
        }

        [Fact]
        public void Export_exports_sale_graph()
        {
            var stateMachine = GetSaleStateMachine();
            var summary = stateMachine.GetSummary();
            var dotGraph = DotGraphExporter<SaleState, SaleEvent>.Export(summary);
        }

        private StateMachine<Sale, SaleState, SaleEvent> GetSaleStateMachine()
        {
            var sut = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: sale2 => sale2.State
              , stateMutator: (sale3, newState) => sale3.State = newState);
#pragma warning disable 219
            var entryActionFired = false;
#pragma warning restore 219

            sut.ConfigureState(SaleState.Open)
               .AddTransition(SaleEvent.Pay, SaleState.Complete, (sale => Math.Abs(sale.Balance) < 0.01))
               .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, (sale => sale.Balance < 0));

            sut.ConfigureState(SaleState.Complete)
               .AddEntryAction(sale1 => entryActionFired = true);

            return sut;
        }
    }
}
