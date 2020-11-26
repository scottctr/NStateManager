using NSimpleTester;
using Xunit;

namespace NStateManager.Tests
{
    public class SimpleTests
    {
        [Fact]
        public void Simple_Tests()
        {
            new AssemblyTester(typeof(FunctionAction<>).Assembly)
                .ExcludeClass("ExecutionParameters`2")
                .ExcludeClass("FunctionAction`1")
                .ExcludeClass("FunctionActionBase`1")
                .ExcludeClass("FunctionActionParameterized`2")
                .ExcludeClass("StateConfigurationBase`3")
                .ExcludeClass("StateTransitionBase`3")
                .ExcludeClass("StateTransitionDynamic`3")
                .ExcludeClass("StateTransitionDynamicBase`3")
                .ExcludeClass("StateTransitionDynamicParameterized`4")
                .ExcludeClass("StateTransitionNonDynamic`3")
                .ExcludeClass("StateTransitionResult`2")
                .ExcludeClass("TransitionEventArgs`3")
                .ExcludeClass("TriggerAction`2")
                .ExcludeClass("TriggerActionBase`2")
                .ExcludeClass("TriggerActionParameterized`3")
                .ExcludeClass("StateMachine`3")
                .ExcludeClass("StateConfiguration`3")
                .ExcludeClass("StateTransition`3")
                .ExcludeClass("StateTransitionAutoDynamic`3")
                .ExcludeClass("StateTransitionAutoDynamicParameterized`4")
                .ExcludeClass("StateTransitionAutoFallback`3")
                .ExcludeClass("StateTransitionAutoFallbackParameterized`4")
                .ExcludeClass("StateTransitionAutoForward`3")
                .ExcludeClass("StateTransitionAutoForwardParameterized`4")
                .ExcludeClass("StateTransitionParameterized`4")
                .ExcludeClass("ConfigurationSummary`2")
                .ExcludeClass("CsvExporter`2")
                .ExcludeClass("DotGraphExporter`2")
                .ExcludeClass("StateDetails`2")
                .ExcludeClass("TransitionDetails`2")
                .ExcludeClass("StateConfigurationAsync`3")
                .ExcludeClass("StateMachineAsync`3")
                .ExcludeClass("StateTransitionAsync`3")
                .ExcludeClass("StateTransitionAutoDynamicAsync`3")
                .ExcludeClass("StateTransitionAutoDynamicParameterizedAsync`4")
                .ExcludeClass("StateTransitionAutoFallbackAsync`3")
                .ExcludeClass("StateTransitionAutoFallbackParameterizedAsync`4")
                .ExcludeClass("StateTransitionAutoForwardAsync`3")
                .ExcludeClass("StateTransitionAutoFallbackParameterizedAsync`4")
                .ExcludeClass("StateTransitionAutoForwardParameterizedAsync`4")
                .ExcludeClass("StateTransitionParameterizedAsync`4")
                .TestAssembly();
        }
    }
}