namespace NStateManager.Tests
{
    /// <summary>
    /// A test request payload for use in <see cref="StateMachineAsync{T,TState,TTrigger}.FireTriggerAsync{Result}"/> calls
    /// </summary>
    public sealed class TestRequest
    {
        public double Value { get; }
        public TestRequest(double value)
        {
            Value = value;
        }
    }
}
