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
using Output = System.Console;

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

            _stateMachine.RegisterOnTransitionedEvent((sale, transitionDetails) 
                => Output.WriteLine($"Sale {sale.SaleID} transitioned from {transitionDetails.PreviousState} to {transitionDetails.CurrentState}."));

            _stateMachine.ConfigureState(SaleState.Open)
                .AddTriggerAction<SaleItem>(SaleEvent.AddItem, (sale, saleItem) =>
                    {
                        sale.AddItem(saleItem);
                        Output.WriteLine($"Adding {saleItem.Name} for {saleItem.Price:C}. {getSaleStatus(sale)}");
                    })
                .AddTriggerAction<Payment>(SaleEvent.Pay, (sale, payment) =>
                    {
                        sale.AddPayment(payment);
                        Output.WriteLine($"Adding payment of {payment.Amount:C}. {getSaleStatus(sale)}");
                    })
                .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, sale => sale.Balance < 0, "Open2ChangeDue", priority: 1)
                .AddTransition(SaleEvent.Pay, SaleState.Complete, sale => Math.Abs(sale.Balance) < .005, "Open2Complete", priority: 2);

            _stateMachine.ConfigureState(SaleState.ChangeDue)
               // .AddEntryAction(sale => Output.WriteLine("Sale is waiting for change to be returned." + getSaleStatus(sale)))
                .AddTriggerAction<Payment>(SaleEvent.ChangeGiven, (sale, payment) =>
                {
                    sale.ReturnChange();
                    Output.WriteLine($"Returning change of {payment.Amount:C}. {getSaleStatus(sale)}");
                })
                .AddTransition(SaleEvent.ChangeGiven, SaleState.Complete);

          //  _stateMachine.ConfigureState(SaleState.Complete)
          //      .AddEntryAction(sale => Output.WriteLine("Sale is complete" + getSaleStatus(sale)));
        }

        private static string getSaleStatus(Sale sale)
        {
            return $"\r\n--> SaleState: {sale.State}     \tBalance: {sale.Balance:$#,##0.00}.";
        }

        public static void AddItem(Sale sale, SaleItem saleItem)
        {
            _stateMachine.FireTrigger(sale, SaleEvent.AddItem, saleItem);
        }

        public static void AddPayment(Sale sale, Payment payment)
        {
            _stateMachine.FireTrigger(sale, SaleEvent.Pay, payment);
        }

        public static void ReturnChange(Sale sale, Payment payment)
        {
            _stateMachine.FireTrigger(sale, SaleEvent.ChangeGiven, payment);
        }
    }
}
