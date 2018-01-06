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
using Xunit;

namespace NStateManager.Example.Sale
{
    public class Tests
    {
        [Fact]
        public void AddItem_adds_the_item()
        {
            var sale = new Sale();
            var saleItem = new SaleItem(price: 1.00M);
            Assert.Equal(expected: 0, actual: sale.ItemCount);

            SaleStateManager.Fire(sale, SaleEvent.AddItem, saleItem);

            Assert.Equal(expected: 1, actual: sale.ItemCount);
        }

        [Fact]
        public void AddItem_throws_InvalidOperationException_if_sale_cancelled()
        {
            var sale = new Sale(SaleState.Cancelled);
            var saleItem = new SaleItem(price: 1.00M);

            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(sale, SaleEvent.AddItem, saleItem));
        }

        [Fact]
        public void AddPayment_adds_the_payment()
        {
            var sale = new Sale();
            var payment = new Payment(amount: 1.00M);
            Assert.Equal(expected: 0, actual: sale.PaymentCount);

            SaleStateManager.Fire(sale, SaleEvent.AddPayment, payment);

            Assert.Equal(expected: 1, actual: sale.PaymentCount);
        }

        [Fact]
        public void AddPayment_throws_InvalidOperationException_if_sale_complete()
        {
            var sale = new Sale(SaleState.Completed);
            var payment = new Payment(amount: 1.00M);

            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(sale, SaleEvent.AddPayment, payment));
        }

        [Fact]
        public void Cancel_cancels_all_items()
        {
            var sale = new Sale();
            var saleItem = new SaleItem(price: 1.00M);
            sale.AddItem(saleItem);
            Assert.Equal(SaleItemState.NotDelivered, saleItem.State);

            SaleStateManager.Fire(sale, SaleEvent.Cancel);

            Assert.Equal(SaleItemState.Cancelled, saleItem.State);
        }

        [Fact]
        public void Cancel_throws_InvalidOperationException_if_sale_has_undelivered_items()
        {
            var sale = new Sale();
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(1.00M) { RequiresDelivery = true });

            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(sale, SaleEvent.Cancel));
        }

        [Fact]
        public void Cancel_on_Authorized_goes_to_Cancelled()
        {
            var sale = new Sale();
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 2.22M));
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(amount: 5.00M));
            SaleStateManager.Fire(sale, SaleEvent.Cancel);

            Assert.Equal(SaleState.Cancelled, sale.State);
        }

        [Fact]
        public void AddPayment_on_Open_sale_leaves_state_Open_if_0_items()
        {
            var sale = new Sale();
            var payment = new Payment(amount: 1.00M);

            SaleStateManager.Fire(sale, SaleEvent.AddPayment, payment);

            Assert.Equal(SaleState.Opened, sale.State);
        }

        [Fact]
        public void AddPayment_on_Open_sale_sets_state_WaitingForDelivery_if_items_to_deliver()
        {
            var sale = new Sale();
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 1.00M));
            var payment = new Payment(amount: 1.00M);

            SaleStateManager.Fire(sale, SaleEvent.AddPayment, payment);

            Assert.Equal(SaleState.WaitingForDelivery, sale.State);
        }

        [Fact]
        public void AddPayment_on_Open_sale_sets_state_Completed_if_items_delivered_and_0_balance()
        {
            var sale = new Sale();
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 1.00M, state: SaleItemState.Delivered));
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(amount: 1.00M));

            Assert.Equal(SaleState.Completed, sale.State);
        }

        [Fact]
        public void AddPayment_on_Open_sale_sets_state_ChangeDue_if_items_delivered_and_negative_balance()
        {
            var sale = new Sale();
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 1.00M, state: SaleItemState.Delivered));
            var payment = new Payment(amount: 3.00M);

            SaleStateManager.Fire(sale, SaleEvent.AddPayment, payment);

            Assert.Equal(SaleState.ChangeDue, sale.State);
        }

        [Fact]
        public void AddPayment_while_Open_adds_payment_to_sale()
        {
            var sale = new Sale();
            const decimal paymentAmount = 1.23M;
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(paymentAmount));

            Assert.Equal(-paymentAmount, sale.Balance);
        }

        [Fact]
        public void AddPayment_on_CompletedSale_throws_InvalidOperationException()
        {
            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(new Sale(SaleState.Completed), SaleEvent.AddPayment, new Payment(amount: 1)));
        }

        [Fact]
        public void AddPayment_on_CancelledSale_throws_InvalidOperationException()
        {
            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(new Sale(SaleState.Cancelled), SaleEvent.AddPayment, new Payment(amount: 1)));
        }

        [Fact]
        public void GiveChange_throws_InvalidOperationException_when_balance_is_positive()
        {
            var sale = new Sale(SaleState.Authorized) { Balance = 1 };

            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(sale, SaleEvent.ChangeGiven, new ChangeTransaction(amount: 5.55M)));
        }

        [Fact]
        public void GiveChange_throws_InvalidOperationException_when_amount_exceeds_balance()
        {
            var sale = new Sale(SaleState.Authorized) { Balance = -1 };

            Assert.Throws<InvalidOperationException>(() => SaleStateManager.Fire(sale, SaleEvent.ChangeGiven, new ChangeTransaction(5.55M)));
        }

        [Fact]
        public void GiveChange_updates_balance()
        {
            var sale = new Sale();

            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 4.55M));
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(amount: 5.00M));
            Assert.True(SaleStateManager.IsInState(sale, SaleState.Authorized));
            SaleStateManager.Fire(sale, SaleEvent.ChangeGiven, new ChangeTransaction(amount: .45M));

            Assert.Equal(expected: 0, actual: sale.Balance);
        }

        [Fact]
        public void ItemDelivered_sets_state_to_Completed_if_fully_balanced_and_delivered()
        {
            var sale = new Sale();

            var saleItem = new SaleItem(price: 4.55M);
            SaleStateManager.Fire(sale, SaleEvent.AddItem, saleItem);
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(amount: 4.55M));
            Assert.Equal(SaleState.WaitingForDelivery, sale.State);
            SaleStateManager.Fire(sale, SaleEvent.ItemDelivered, saleItem);

            Assert.Equal(SaleState.Completed, sale.State);
        }

        [Fact]
        public void AddItem_on_Authorized_sets_state_to_PartiallyAuthorized()
        {
            var sale = new Sale();
            var saleItem = new SaleItem(price: 4.55M);
            SaleStateManager.Fire(sale, SaleEvent.AddItem, saleItem);
            SaleStateManager.Fire(sale, SaleEvent.ItemDelivered, saleItem);
            SaleStateManager.Fire(sale, SaleEvent.AddPayment, new Payment(amount: 5.55M));
            SaleStateManager.Fire(sale, SaleEvent.AddItem, new SaleItem(price: 2.22M));
            
            Assert.Equal(SaleState.PartiallyAuthorized, sale.State);
        }
    }
}
