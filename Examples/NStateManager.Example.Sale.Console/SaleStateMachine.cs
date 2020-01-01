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
using NStateManager.Sync;
using System;
using Output = System.Console;

namespace NStateManager.Example.Sale.Console
{
    public static class SaleStateMachine
    {
        private static readonly StateMachine<Sale, SaleState, SaleEvent> _stateMachine;

        static SaleStateMachine()
        {
            //State machine to manage sales for a point of sale system
            _stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(
                stateAccessor: (sale) => sale.State
                ,stateMutator: (sale, state) => sale.State = state);

            //Log each time a sale changes state regardless of to/from state
            _stateMachine.OnTransition += (sender, args) => Output.WriteLine($"Sale {args.Parameters.Context.SaleID} transitioned from {args.TransitionResult.PreviousState} to {args.TransitionResult.CurrentState}.");

            //Configure the Open state
            _stateMachine.ConfigureState(SaleState.Open)
               //Process the new item on the AddItem event 
               .AddTriggerAction<SaleItem>(SaleEvent.AddItem, (sale, saleItem) =>
                    {
                        sale.AddItem(saleItem);
                        Output.WriteLine($"Adding {saleItem.Name} for {saleItem.Price:C}. {getSaleStatus(sale)}");
                    })
                //Process the payment on the Pay event
                .AddTriggerAction<Payment>(SaleEvent.Pay, (sale, payment) =>
                    {
                        sale.AddPayment(payment);
                        Output.WriteLine($"Adding payment of {payment.Amount:C}. {getSaleStatus(sale)}");
                    })
                //Transition to the ChangeDue state if customer over pays
                .AddTransition(SaleEvent.Pay, SaleState.ChangeDue, condition: sale => sale.Balance < 0, name: "Open2ChangeDue", priority: 1)
                //Transition to the Completed state  if customer pays exact amount
                .AddTransition(SaleEvent.Pay, SaleState.Complete, condition: sale => Math.Abs(sale.Balance) < .005, name: "Open2Complete", priority: 2);

            //Configure the ChangeDue state
            _stateMachine.ConfigureState(SaleState.ChangeDue)
                //Process the returned change on the ChangeGiven event
                .AddTriggerAction<Payment>(SaleEvent.ChangeGiven, (sale, payment) =>
                {
                    sale.ReturnChange();
                    Output.WriteLine($"Returning change of {payment.Amount:C}. {getSaleStatus(sale)}");
                })
                //Transition to the Complete state on ChangeGiven -- no conditions
                .AddTransition(SaleEvent.ChangeGiven, SaleState.Complete);

            //No configuration required for Complete state since it's a final state and
            //transitions or actions are taken at this point
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
