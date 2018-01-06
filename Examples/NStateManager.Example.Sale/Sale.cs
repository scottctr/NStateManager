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
using System.Collections.Generic;
using System.Linq;

namespace NStateManager.Example.Sale
{
    public class Sale
    {
        private readonly List<ChangeTransaction> _changeTransactions = new List<ChangeTransaction>();
        private readonly List<SaleItem> _saleItems = new List<SaleItem>();
        private readonly List<Payment> _payments = new List<Payment>();

        public decimal Balance { get; internal set; }

        public bool HasItems => _saleItems.Count > 0;

        public bool IsFullyDelivered => _saleItems.TrueForAll(saleItem => saleItem.IsDelivered || saleItem.State == SaleItemState.Cancelled);

        public int ItemCount => _saleItems.Count(saleItem => saleItem.State != SaleItemState.Cancelled);

        public int PaymentCount => _payments.Count;

        public SaleState State { get; internal set; }

        public Sale(SaleState state = SaleState.Opened)
        {
            State = state;
        }

        public void AddChangeTransaction(ChangeTransaction changeTransaction)
        {
            if (State == SaleState.Completed || State == SaleState.Cancelled)
            { throw new InvalidOperationException("Change cannot be given on a Completed or Cancelled sale."); }

            if (Balance >= 0)
            { throw new InvalidOperationException("Change can only be given on a sale with a negative balance."); }

            if (changeTransaction.Amount > Math.Abs(Balance))
            { throw new InvalidOperationException("Change amount cannot exceed change due amount."); }

            _changeTransactions.Add(changeTransaction);
            calculateBalance();
        }

        public void AddItem(SaleItem item)
        {
            if (State == SaleState.Completed || State == SaleState.Cancelled)
            { throw new InvalidOperationException("Items cannot be added to a Completed or Cancelled sale."); }

            _saleItems.Add(item);
            calculateBalance();
        }

        public void AddPayment(Payment payment)
        {
            if (State == SaleState.Completed || State == SaleState.Cancelled)
            { throw new InvalidOperationException("Payments cannot be added to a Completed or Cancelled sale."); }

            _payments.Add(payment);
            calculateBalance();
        }

        public void Cancel()
        {
            if (State == SaleState.Completed || State == SaleState.Cancelled)
            { throw new InvalidOperationException("Cannot cancel a Completed or Cancelled sale."); }

            if (HasUndeliveredAuthorizedItems())
            { throw new InvalidOperationException("Sale cannot be cancelled because some of the delivered items cannot be returned."); }

            _saleItems.ForEach(saleItem => saleItem.State = SaleItemState.Cancelled);
        }

        public bool HasUndeliveredAuthorizedItems()
        {
            return _saleItems.Any(saleItem => saleItem.RequiresDelivery
                                             // && saleItem.IsAuthorized
                                              && !saleItem.IsDelivered
                                              && !saleItem.IsCancelled);
        }

        public bool HasNonRemovableItems()
        {
            return _saleItems.Any(saleItem => (!saleItem.IsCancelled) && (!saleItem.IsRemovableAfterDelivery) && saleItem.IsDelivered);
        }

        public bool IsCancellable()
        {
            return _saleItems.Count > 0 && !HasNonRemovableItems();
        }

        private void calculateBalance()
        {
            Balance = _saleItems.Sum(si => si.Price)
                    - _payments.Sum(p => p.Amount)
                    + _changeTransactions.Sum(ct => ct.Amount);
        }

        public void MarkItemDelivered(SaleItem item)
        {
            if (State != SaleState.Cancelled)
            { item.State = SaleItemState.Delivered; }
        }
    }
}
