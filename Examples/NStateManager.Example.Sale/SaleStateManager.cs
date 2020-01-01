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

namespace NStateManager.Example.Sale
{
    public class SaleStateManager
    {
        private static readonly StateMachine<Sale, SaleState, SaleEvent> _saleStateManager;

        static SaleStateManager()
        {
            //Create a StateMachine with the defined context, state, and trigger types
            //context: type who's state is being managed
            //state: type used to define the states of the context objects (enum recommended, but can be any type)
            //trigger: type used to define the triggers (or events) that may affect the context's state
            _saleStateManager = new StateMachine<Sale, SaleState, SaleEvent>(
                //The stateAccessor parameter tells the stateMachine how to determine the sale's current state
                stateAccessor: (s) => s.State
                //The stateMutator parameter tells the stateMachine how to update the sale's state
                ,stateMutator: (sale, newState) => sale.State = newState);

            //Setup the trigger actions that are mostly consistent across all states. Exceptions can be handled in the action.
            //Trigger actions define how to process a system event, frequently with a "request" (i.e. TRequest) as a parameter.
            //Specialized trigger action can be defined for individual states. See the Authorized configuration below for an example.
            _saleStateManager
                //We want to add as many items to a sale as possible, so we'll always try to add an item to a sale.
                //See Sale.AddItem() to see how exceptions are handled.
                .AddTriggerAction<SaleItem>(SaleEvent.AddItem, action: (sale, saleItem) => sale.AddItem(saleItem))
                //Like adding items, we want to accept a payment if at all possible
                //See Sale.AddPayment() to see how exceptions are handled.
                .AddTriggerAction<Payment>(SaleEvent.AddPayment, action: (sale, payment) => sale.AddPayment(payment))
                //.AddTriggerAction<ChangeTransaction>(SaleEvent.ChangeGiven, (sale, ct) => sale.AddChangeTransaction(ct))
                //We can cancel most sales. See Sale.Cancel() to see how exceptions are handled
                .AddTriggerAction(SaleEvent.Cancel, action: sale => sale.Cancel())
                .AddTriggerAction<SaleItem>(SaleEvent.ItemDelivered, (sale, item) => sale.MarkItemDelivered(item));

            //The Opened state indicates that the sale has been started, but not fully paid for and/or delivered
            _saleStateManager.ConfigureState(SaleState.Opened)
                //When a payment is made, the sale can land on several different states so we define it as 
                //dynamic transition with the function that selects the final state.
                .AddDynamicTransition<Payment>(SaleEvent.AddPayment, (sale, _) => ProcessPayment(sale))
                //When a sale is cancelled, we cancel it without any conditions.
                .AddTransition(SaleEvent.Cancel, SaleState.Cancelled);

            //The Authorized state indicates that the sale is fully paid, but may be waiting for delivery, change, or both.
            //Note that a sale will never be directly in the Authorized state. It will use the WaitingForDelivery or ChangeDue substate as appropriate.
            //We configure the Authorized state for requirements that are the same for all substates.
            _saleStateManager.ConfigureState(SaleState.Authorized)
                //Since change can only be given in while in an Authorized substate, we're defining how to process it here.
                .AddTriggerAction<ChangeTransaction>(SaleEvent.ChangeGiven, (sale, changeTransaction) => sale.AddChangeTransaction(changeTransaction))
                //When an item is added here, we move to the PartiallyAuthorized state if the balance goes positive.
                .AddTransition(SaleEvent.AddItem, SaleState.PartiallyAuthorized, condition: sale => sale.Balance > 0)
                //When the clerk gives the customer their change, the sale is Completed if all items delivered and the balance is 0.
                .AddTransition(SaleEvent.ChangeGiven, SaleState.Completed, condition: sale => sale.Balance == 0 && sale.IsFullyDelivered)
                //If a cancel is requested, we can only change to Cancelled if no unremovable sale items have been delivered.
                .AddTransition(SaleEvent.Cancel, SaleState.Cancelled, condition: sale => sale.IsCancellable());

            //The WaitingForDelivery substate indicates that the sale has items that haven't been fuly delivered.
            //This could be used for gas, car wash, oil change, food, etc.
            //Also note that a WaitingForDelivery sale could also have change due, but WaitingForDelivery take priority since 
            //we may not know the total sale amount until all items delivered. For instance, the gas pumped may not be exactly
            //the same as the amount they prepaid for.
            _saleStateManager.ConfigureState(SaleState.WaitingForDelivery)
                //The following line establishes WaitingForDelivery as a substate of Authorized
                .MakeSubStateOf(_saleStateManager.ConfigureState(SaleState.Authorized))
                .AddDynamicTransition(SaleEvent.ItemDelivered, ProcessItemDelivered);

            //The ChangeDue substate indicates the customer has some money coming back before we can Complete the sale.
            _saleStateManager.ConfigureState(SaleState.ChangeDue)
                //The following line establishes ChangeDue as a substate of Authorized
                .MakeSubStateOf(_saleStateManager.ConfigureState(SaleState.Authorized));
                //Unlike the WaitingForDelivery substate, uses the Authorized transitions it inherits and no further transition definitions required.

            _saleStateManager.ConfigureState(SaleState.PartiallyAuthorized)
                .AddDynamicTransition<Payment>(SaleEvent.AddPayment, (sale, _) => ProcessPayment(sale))
                //When the clerk gives the customer their change, the sale is Completed if all items delivered and the balance is 0.
                .AddTransition(SaleEvent.ChangeGiven, SaleState.Completed, condition: sale => sale.Balance == 0 && sale.IsFullyDelivered)
                //If a cancel is requested, we can only change to Cancelled if no unremovable sale items have been delivered.
                .AddTransition(SaleEvent.Cancel, SaleState.Cancelled, condition: sale => sale.IsCancellable());

            //TODO should you have to configure a state that needs no configuration details??
            _saleStateManager.ConfigureState(SaleState.Cancelled);
            _saleStateManager.ConfigureState(SaleState.Completed);
        }

        private static SaleState ProcessItemDelivered(Sale sale)
        {
            if (sale.IsFullyDelivered)
            {
                //When an item is delivered, the sale is Complete if all items have been delivered and the balance is 0.
                if (sale.Balance == 0)
                { return SaleState.Completed; }

                //When an item is delivered, the state changes to ChangeDue if the balance is negative.
                if (sale.Balance < 0)
                { return SaleState.ChangeDue; }
            }

            return sale.State;
        }

        private static SaleState ProcessPayment(Sale sale)
        {
            if (!sale.HasItems)
            { return sale.State; }

            if (sale.IsFullyDelivered)
            {
                return sale.Balance == 0
                    //Complete if the balance is 0 and all items delivered
                    ? SaleState.Completed
                    //ChangeDue if there's a negative balance and all items delivered
                    : SaleState.ChangeDue;
            }
            else
            {
                //WaitingForDelivery if there are any items on the sale not fully delivered
                return SaleState.WaitingForDelivery;
            }
        }

        public static StateTransitionResult<SaleState, SaleEvent> Fire(Sale sale, SaleEvent saleEvent)
        {
            return _saleStateManager.FireTrigger(sale, saleEvent);
        }

        public static StateTransitionResult<SaleState, SaleEvent> Fire(Sale sale, SaleEvent saleEvent, ChangeTransaction change)
        {
            return _saleStateManager.FireTrigger(sale, saleEvent, change);
        }

        public static StateTransitionResult<SaleState, SaleEvent> Fire(Sale sale, SaleEvent saleEvent, Payment payment)
        {
            return _saleStateManager.FireTrigger(sale, saleEvent, payment);
        }

        public static StateTransitionResult<SaleState, SaleEvent> Fire(Sale sale, SaleEvent saleEvent, SaleItem saleItem)
        {
            return _saleStateManager.FireTrigger(sale, saleEvent, saleItem);
        }

        public static bool IsInState(Sale sale, SaleState state)
        {
            return _saleStateManager.IsInState(sale, state);
        }
    }
}
