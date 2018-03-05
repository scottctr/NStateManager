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

namespace NStateManager.Tests
{
    public class TriggerActionParameterizedTests
    {
        [Fact]
        public void Constructor_sets_Action()
        {
            void UpdateBalance(Sale sale, double newBalance) => sale.Balance = newBalance;
            var sut = new TriggerActionParameterized<Sale, SaleEvent, double>(UpdateBalance);

            Assert.Equal(UpdateBalance, sut.Action);
        }

        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Action_null()
        {
            Assert.Throws<ArgumentNullException>(() => new TriggerActionParameterized<Sale, SaleEvent, double>(action: null));
        }

        [Fact]
        public void Execute_throws_ArgumentNullException_if_parameters_null()
        {
            void UpdateBalance(Sale sale, double newBalance) => sale.Balance = newBalance;
            var sut = new TriggerActionParameterized<Sale, SaleEvent, double>(UpdateBalance);

            Assert.Throws<ArgumentNullException>(() => sut.Execute(parameters: null));
        }

        [Fact]
        public void Execute_throws_ArgumentException_if_parametersRequest_wrongType()
        {
            void UpdateBalance(Sale sale, double newBalance) => sale.Balance = newBalance;
            var sut = new TriggerActionParameterized<Sale, SaleEvent, double>(UpdateBalance);
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.AddItem, new Sale(saleID: 24), request: "wrongType");

            Assert.Throws<ArgumentException>(() => sut.Execute(parameters));
        }

        [Fact]
        public void Execute_executes_Action()
        {
            void UpdateBalance(Sale sale, double newBalance) => sale.Balance = newBalance;
            var sut = new TriggerActionParameterized<Sale, SaleEvent, double>(UpdateBalance);

            var testSale = new Sale(saleID: 24);
            var updatedBalance = 23.45;
            var parameters = new ExecutionParameters<Sale, SaleEvent>(SaleEvent.AddItem, testSale, request: updatedBalance);

            sut.Execute(parameters);

            Assert.Equal(updatedBalance, testSale.Balance);
        }
    }
}
