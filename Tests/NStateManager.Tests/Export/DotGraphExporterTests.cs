using NStateManager.Export;
using NStateManager.Sync;
using System;
using System.Linq;
using Xunit;

namespace NStateManager.Tests.Export
{
    public class DotGraphExporterTests
    {
        [Fact]
        public void Export_exports_sale_graph()
        {
            var stateMachine = getSaleStateMachine();
            var summary = stateMachine.GetSummary();

            var dotGraphLines = DotGraphExporter<SaleState, SaleEvent>.Export(summary)?.Split("\r\n");

            Assert.Equal("digraph NStateManagerGraph {", dotGraphLines.First());
            Assert.Equal("\trankdir=LR;", dotGraphLines[1]);
            Assert.Equal(string.Empty, dotGraphLines[2]);
            Assert.Equal(string.Empty, dotGraphLines[3]);
            Assert.Equal("\tOpen;", dotGraphLines[4]);
            Assert.Equal("\tChangeDue;", dotGraphLines[5]);
            Assert.Equal("\tComplete;", dotGraphLines[6]);
            Assert.Equal(string.Empty, dotGraphLines[7]);
            Assert.Equal("\tOpen -> Complete [label=\"Pay(*)\"];", dotGraphLines[8]);
            Assert.Equal("\tOpen -> ChangeDue [label=\"Pay(*)\"];", dotGraphLines[9]);
        }

        [Fact]
        public void Export_exports_graph_with_substates()
        {
            var stateMachine = getComplexSaleStateMachine();
            var summary = stateMachine.GetSummary();

            var dotGraphLines = DotGraphExporter<SaleComplexState, SaleComplexEvent>.Export(summary)?.Split("\r\n");

            Assert.Equal("digraph NStateManagerGraph {", dotGraphLines[0]);
            Assert.Equal("\tcompound=true;", dotGraphLines[1]);
            Assert.Equal("\trankdir=LR;", dotGraphLines[2]);
            Assert.Equal(string.Empty, dotGraphLines[3]);
            Assert.Equal(string.Empty, dotGraphLines[4]);
            Assert.Equal("\tsubgraph cluster_Open {", dotGraphLines[5]);
            Assert.Equal("\t\tlabel=Open;", dotGraphLines[6]);
            Assert.Equal("\t\tOpen [shape=circle label=\"\" style=filled color=black]", dotGraphLines[7]);
            Assert.Equal(string.Empty, dotGraphLines[8]);
            Assert.Equal("\t\tOverpaid;", dotGraphLines[9]);
            Assert.Equal("\t}", dotGraphLines[10]);
            Assert.Equal(string.Empty, dotGraphLines[11]);
            Assert.Equal("\tsubgraph cluster_Finalized {", dotGraphLines[12]);
            Assert.Equal("\t\tlabel=Finalized;", dotGraphLines[13]);
            Assert.Equal("\t\tFinalized [shape=point color=white];", dotGraphLines[14]);
            Assert.Equal(string.Empty, dotGraphLines[15]);
            Assert.Equal("\t\tPaid;", dotGraphLines[16]);
            Assert.Equal("\t\tCancelled;", dotGraphLines[17]);
            Assert.Equal("\t}", dotGraphLines[18]);
            Assert.Equal(string.Empty, dotGraphLines[19]);
            Assert.Equal("\tOpen -> Cancelled [label=\"Cancel(*)\" ltail=cluster_Open];", dotGraphLines[20]);
            Assert.Equal("\tOpen -> Overpaid [label=\"SetItemQuantity(*)\" ltail=cluster_Open];", dotGraphLines[21]);
            Assert.Equal("\tOpen -> Paid [label=\"SetItemQuantity(*)\" ltail=cluster_Open];", dotGraphLines[22]);
            Assert.Equal("\tOpen -> Overpaid [label=\"Pay(*)\" ltail=cluster_Open];", dotGraphLines[23]);
            Assert.Equal("\tOpen -> Paid [label=\"Pay(*)\" ltail=cluster_Open];", dotGraphLines[24]);
            Assert.Equal("\tOverpaid -> Open [label=\"GiveChange(*)\" lhead=cluster_Open];", dotGraphLines[25]);
            Assert.Equal("\tOverpaid -> Open [label=\"AddItem(*)\" lhead=cluster_Open];", dotGraphLines[26]);
            Assert.Equal("\tOverpaid -> Open [label=\"SetItemQuantity(*)\" lhead=cluster_Open];", dotGraphLines[27]);
            Assert.Equal("}", dotGraphLines[28]);
        }

        private static StateMachine<SaleComplex, SaleComplexState, SaleComplexEvent> getComplexSaleStateMachine()
        {
            var stateMachine = new StateMachine<SaleComplex, SaleComplexState, SaleComplexEvent>(
                stateAccessor: sale1 => sale1.State,
                stateMutator: (sale1, state) => sale1.State = state);

            stateMachine.ConfigureState(SaleComplexState.Open)
                .AddTransition(SaleComplexEvent.Cancel, SaleComplexState.Cancelled, condition: sale => true)
                .AddTransition(SaleComplexEvent.SetItemQuantity, SaleComplexState.Overpaid, condition: sale => true)
                .AddTransition(SaleComplexEvent.SetItemQuantity, SaleComplexState.Paid, condition: sale => true)
                .AddTransition(SaleComplexEvent.Pay, SaleComplexState.Overpaid, condition: sale => true)
                .AddTransition(SaleComplexEvent.Pay, SaleComplexState.Paid, condition: sale => true);
            
            stateMachine.ConfigureState(SaleComplexState.Overpaid)
                .MakeSubStateOf(stateMachine.ConfigureState(SaleComplexState.Open))
                .AddTransition(SaleComplexEvent.GiveChange, SaleComplexState.Open, condition: sale => true)
                .AddTransition(SaleComplexEvent.AddItem, SaleComplexState.Open, condition: sale => true)
                .AddTransition(SaleComplexEvent.SetItemQuantity, SaleComplexState.Open, condition: sale => true);

            stateMachine.ConfigureState(SaleComplexState.Paid)
               .MakeSubStateOf(stateMachine.ConfigureState(SaleComplexState.Finalized));

            stateMachine.ConfigureState(SaleComplexState.Cancelled)
               .MakeSubStateOf(stateMachine.ConfigureState(SaleComplexState.Finalized));

            return stateMachine;
        }

        private static StateMachine<Phone, PhoneState, PhoneEvent> getPhoneStateMachine()
        {
             var stateMachine = new StateMachine<Phone, PhoneState, PhoneEvent>(
            phone => phone.State,
            (phone, state) => phone.State = state);

            var onHookConfig = stateMachine.ConfigureState(PhoneState.OnHook)
                .AddTransition(PhoneEvent.IncomingCall, PhoneState.InRinging)
                .AddTransition(PhoneEvent.PickUp, PhoneState.ReadyToDial)
                .AddTransition(PhoneEvent.LineDisruption, PhoneState.OutOfService)
                .AddTransition(PhoneEvent.RemoveFromService, PhoneState.OutOfService);

            stateMachine.ConfigureState(PhoneState.InRinging)
               .MakeSubStateOf(onHookConfig)
               .AddTransition(PhoneEvent.Answer, PhoneState.Connected);

            var offHookConfig = stateMachine.ConfigureState(PhoneState.OffHook)
               .AddTransition(PhoneEvent.HangUp, PhoneState.OnHook)
               .AddTransition(PhoneEvent.LineDisruption, PhoneState.OutOfService)
               .AddTransition(PhoneEvent.RemoveFromService, PhoneState.OutOfService);

            stateMachine.ConfigureState(PhoneState.ReadyToDial)
               .MakeSubStateOf(offHookConfig)
               .AddTransition(PhoneEvent.Dialing, PhoneState.Dialing);

            stateMachine.ConfigureState(PhoneState.Dialing)
               .MakeSubStateOf(offHookConfig)
               .AddTransition(PhoneEvent.DialingDone, PhoneState.GettingCallerStatus);

            stateMachine.ConfigureState(PhoneState.GettingCallerStatus)
               .MakeSubStateOf(offHookConfig)
               .AddTransition(PhoneEvent.CallerBusy, PhoneState.Busy)
               .AddTransition(PhoneEvent.Ringing, PhoneState.OutRinging);

            stateMachine.ConfigureState(PhoneState.Busy)
               .MakeSubStateOf(offHookConfig);

            stateMachine.ConfigureState(PhoneState.OutRinging)
               .MakeSubStateOf(offHookConfig)
               .AddTransition(PhoneEvent.CallerPickedUp, PhoneState.Connected);

            var connectedState = stateMachine.ConfigureState(PhoneState.Connected)
               .MakeSubStateOf(offHookConfig)
               .AddTransition(PhoneEvent.PutOnHold, PhoneState.OnHold)
               .AddTransition(PhoneEvent.StartRecording, PhoneState.Recording);

            stateMachine.ConfigureState(PhoneState.OnHold)
               .MakeSubStateOf(connectedState)
               .AddTransition(PhoneEvent.RemoveHold, PhoneState.Connected);

            stateMachine.ConfigureState(PhoneState.Recording)
               .MakeSubStateOf(connectedState)
               .AddTransition(PhoneEvent.StopRecording, PhoneState.Connected);

            stateMachine.ConfigureState(PhoneState.OutOfService)
               .AddTransition(PhoneEvent.ReturnToService, PhoneState.OnHook);

            return stateMachine;

        }

        private static StateMachine<Sale, SaleState, SaleEvent> getSaleStateMachine()
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
