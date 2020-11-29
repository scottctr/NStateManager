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

namespace NStateManager.Tests
{
    public class TestSale
    {
        private readonly List<TestPayment> _payments = new List<TestPayment>();
        private readonly List<TestSaleItem> _saleItems = new List<TestSaleItem>();

        public TestSale(int id)
        {
            Id = id;
        }

        public double AmountPaid { get; private set; }

        public double Balance { get; private set; }

        public double ChangeGiven { get; private set; }

        public int Id { get; }

        public bool IsPaid => Math.Abs(Balance) < .001 && _payments.Any() && SaleItems.Any(i => i.Quantity > 0);

        public double PaymentBalance => AmountPaid - ChangeGiven;

        public TestSaleState State { get; internal set; }

        public IReadOnlyList<TestSaleItem> SaleItems => _saleItems.AsReadOnly();

        internal bool HasNegativeBalance()
        {
            return Balance < 0;
        }

        internal bool HasPositiveBalance()
        {
            return Balance > 0;
        }

        internal bool IsCancellable()
        {
            return Math.Abs(PaymentBalance) < 0.001;
        }
    }
}