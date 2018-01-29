using System;
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
            var cancellationSource = new CancellationTokenSource();
            var sale = new Sale(saleID: 3);
            var sut = new FunctionAction<Sale>((_, cancelToken) => 
                Task.Delay(millisecondsDelay: 999999, cancellationToken: cancelToken));
            
            var funcTask = Task.Run(async () => await sut.ExecuteAsync(sale, cancellationSource.Token, request: null));

            cancellationSource.Cancel();
            Task.Delay(millisecondsDelay: 11).Wait();

            Assert.True(funcTask.IsCanceled);
        }
    }
}
