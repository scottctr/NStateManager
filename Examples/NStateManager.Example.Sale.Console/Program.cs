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
namespace NStateManager.Example.Sale.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            var sale = new Sale(saleID: 1);
            SaleStateMachine.AddItem(sale, new SaleItem("Magazine", price: 3.00));
            SaleStateMachine.AddItem(sale, new SaleItem("Fuel", price: 10.00));
            SaleStateMachine.AddPayment(sale, new Payment(amount: 10.00));
            SaleStateMachine.AddPayment(sale, new Payment(amount: 10.00));
            SaleStateMachine.ReturnChange(sale, new Payment(amount: -7.00));

            System.Console.Read();
        }
    }
}

