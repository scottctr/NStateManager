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
    }
}
