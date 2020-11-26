using System;
using System.Linq;
using System.Text;

namespace NStateManager.Export
{
    public class DotGraphExporter<TState, TTrigger> where TState : IComparable
    {
        public static string Export(ConfigurationSummary<TState, TTrigger> summary)
        {
            var dotGraph = new StringBuilder();
            dotGraph.AppendLine("digraph NStateManagerGraph {");
            dotGraph.AppendLine("\trankdir=LR");

            //List all the nodes. Note sure this is needed, but do want to show nodes that aren't included in transitions.
            foreach (var state in summary.StateDetails.OrderBy(s => s.IsStartingState))
            { dotGraph.AppendLine($"\t{state.State};"); }

            //List all the transitions.
            foreach (var transition in summary.Transitions)
            {
                dotGraph.Append($"\t{transition.FromState.State} -> {transition.ToState.State}");

                dotGraph.Append(" [label=\"");

                if (!string.IsNullOrWhiteSpace(transition.Name))
                { dotGraph.Append(transition.Trigger); }

                if (transition.HasCondition)
                { dotGraph.Append("(*)"); }

                dotGraph.Append("\"]");

                dotGraph.AppendLine(";");
            }

            //Starting states should all be at same level
            if (summary.StartingStates.Any())
            {
                dotGraph.Append("\t{ rank=same;");
                foreach (var state in summary.StartingStates)
                { dotGraph.Append(" " + state.State); }
                dotGraph.AppendLine(" }");
            }

            //Final states should all be at same level
            if (summary.FinalStates.Any())
            {
                dotGraph.Append("\t{ rank=same;");
                foreach (var state in summary.FinalStates)
                { dotGraph.Append(" " + state.State); }
                dotGraph.AppendLine(" }");
            }

            dotGraph.AppendLine("}");

            return dotGraph.ToString();
        }
    }
}