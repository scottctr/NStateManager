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
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class FunctionActionParameterizedTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Action_null()
        {
            Assert.Throws<ArgumentNullException>(() => new FunctionActionParameterized<Sale, Sale>(action: null));
        }

        [Fact]
        public async Task ExecuteAsync_executes_Action()
        {
            const double updatedBalance = 1.23;
            var sale = new Sale(saleID: 5) { Balance = 0 };
            var sut = new FunctionActionParameterized<Sale, Sale>((sale1, sale2, _) => Task.FromResult(sale1.Balance = updatedBalance));

            await sut.ExecuteAsync(sale, request: sale, cancellationToken: default(CancellationToken));

            Assert.Equal(updatedBalance, sale.Balance);
        }

        [Fact]
        public void ExecuteAsync_can_be_cancelled()
        {
            var cancellationSource = new CancellationTokenSource();
            var sale = new Sale(saleID: 3);
            var sut = new FunctionActionParameterized<Sale, Sale>((_, sale2, cancelToken) => 
                Task.Delay(millisecondsDelay: 999999, cancellationToken: cancelToken));
            
            var funcTask = Task.Run(async () => await sut.ExecuteAsync(sale, cancellationSource.Token, request: sale), cancellationSource.Token);

            cancellationSource.Cancel();
            Task.Delay(millisecondsDelay: 67).Wait();

            Assert.True(funcTask.IsCanceled);
        }

        [Fact]
        public async Task ExecuteAsync_throws_ArgumentException_if_request_wrong_Type()
        {
            const double updatedBalance = 1.23;
            var sale = new Sale(saleID: 5) { Balance = 0 };
            var sut = new FunctionActionParameterized<Sale, Sale>((sale1, sale2, _) => Task.FromResult(sale1.Balance = updatedBalance));

            await Assert.ThrowsAsync<ArgumentException>(() => sut.ExecuteAsync(sale, request: "wrongType", cancellationToken: default(CancellationToken)));
        }
    }
}
