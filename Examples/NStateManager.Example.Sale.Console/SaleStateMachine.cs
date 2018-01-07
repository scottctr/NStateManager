using Output=System.Console;

namespace NStateManager.Example.Sale.Console
{
    public static class SaleStateMachine
    {
        private static readonly StateMachine<Sale, SaleState, SaleEvent> _stateMachine;

        static SaleStateMachine()
        {
            _stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: (sale) => sale.State
                ,stateMutator: (sale, state) => sale.State = state);

            _stateMachine.ConfigureState(SaleState.Open)
                .AddTriggerAction<SaleItem>(SaleEvent.AddItem, (sale, saleItem) =>
                    {
                        sale.AddItem(saleItem);
                        Output.WriteLine($"{saleItem.Name} added for {saleItem.Price:C}. Balance {sale.Balance:C}");
                    })
                .AddTriggerAction<Payment>(SaleEvent.Pay, (sale, payment) =>
                    {
                        sale.AddPayment(payment);
                        Output.WriteLine($"Payment of {payment.Amount:C} added. Balance {sale.Balance:C}");
                    })
                .AddTransition(SaleEvent.Pay, SaleState.Complete, sale => sale.Balance == 0);

            _stateMachine.ConfigureState(SaleState.Complete)
                .AddEntryAction(_ => Output.WriteLine("Sale is complete"));
        }

        public static void AddItem(Sale sale, SaleItem saleItem)
        {
            _stateMachine.FireTrigger(sale, SaleEvent.AddItem, saleItem);
        }

        public static void AddPayment(Sale sale, Payment payment)
        {
            _stateMachine.FireTrigger(sale, SaleEvent.Pay, payment);
        }
    }
}
