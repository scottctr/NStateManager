using Xunit;

namespace NStateManager.Tests
{
    public class ExecutionParametersTests
    {
        [Fact]
        public void Constructor_sets_properties()
        {
            var sut = new ExecutionParameters<int, string>("trigger", context: 4, request: "Scott");

            Assert.Equal(expected: 4, actual: sut.Context);
            Assert.Equal("Scott", sut.Request);
        }
    }
}
