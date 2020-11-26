using System;
using System.Linq;
using System.Text;

namespace NStateManager.Export
{
    public class CsvExporter<TState, TTrigger> where TState : IComparable
    {
        public static string Export(ConfigurationSummary<TState, TTrigger> summary)
        {
            var csv = new StringBuilder();
            csv.AppendLine("FromState, TriggerEvent, ToState, Condition");

            foreach (var transition in summary.Transitions.OrderByDescending(t => t.FromState.IsStartingState).ThenByDescending(t => t.ToState.IsFinalState))
            { csv.AppendLine($"{transition.FromState.State}, {transition.Trigger}, {transition.ToState.State}{(transition.HasCondition ? ", *" : string.Empty)}"); }

            return csv.ToString();
        }
    }
}