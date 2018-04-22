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
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace NStateManager.Tests
{
    public class FunctionActionTests
    {
        [Fact]
        public void Constructor_throws_ArgumentNullException_if_Action_null()
        {
            Assert.Throws<ArgumentNullException>(() => new FunctionAction<Sale>(action: null));
        }

        [Fact]
        public async Task ExecuteAsync_executes_Action()
        {
            const double updatedBalance = 1.23;
            var sale = new Sale(saleID: 5) { Balance = 0 };
            var sut = new FunctionAction<Sale>((sale1, _) => Task.FromResult(sale1.Balance = updatedBalance));

            await sut.ExecuteAsync(sale, request: null, cancellationToken: default(CancellationToken));

            Assert.Equal(updatedBalance, sale.Balance);
        }

        [Fact]
        public void ExecuteAsync_can_be_cancelled()
        {
            using (var cancellationSource = new CancellationTokenSource())
            {
                var sale = new Sale(saleID: 3);
                var wasCancelled = false;

                var mutex = new Mutex(initiallyOwned: false);
                var sut = new FunctionAction<Sale>((_, cancelToken) =>
                {
                    mutex.WaitOne();
                    do
                    {
                        Task.Delay(millisecondsDelay: 123).Wait();
                    } while (!cancelToken.IsCancellationRequested);

                    mutex.ReleaseMutex();
                    wasCancelled = true;
                    return Task.FromCanceled(cancelToken);
                });

                Task.Factory.StartNew(async () =>
                {
                    await sut.ExecuteAsync(sale, cancellationSource.Token, request: null);
                }, TaskCreationOptions.LongRunning);

                try
                {
                    Task.Delay(555).Wait();
                    cancellationSource.Cancel();
                }
                catch
                {
                    cancellationSource.Cancel();
                }

                mutex.WaitOne();

                Assert.True(wasCancelled);
            }
        }
    }
}
