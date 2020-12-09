using System;
using System.Collections.Generic;
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
            if (summary.HasSubStates)
            { dotGraph.AppendLine("\tcompound=true;"); }

            // ReSharper disable once StringLiteralTypo
            dotGraph.AppendLine("\trankdir=LR;");
            dotGraph.AppendLine();

            exportNonSuperStates(summary.StateDetails.Where(s => s.StateLevel == 0) , dotGraph, level: 0);
            exportSuperStates(summary.StateDetails.Where(s => s.StateLevel == 1), dotGraph, level: 0);

            //List all the transitions.
            if (summary.Transitions.Any())
            {
                dotGraph.AppendLine();

                foreach (var transition in summary.Transitions)
                {
                    dotGraph.Append($"\t{transition.FromState.State} -> {transition.ToState.State}");
                    dotGraph.Append(" [label=\"");

                    if (!string.IsNullOrWhiteSpace(transition.Name))
                    { dotGraph.Append(transition.Trigger); }

                    if (transition.HasCondition)
                    { dotGraph.Append("(*)"); }
                    dotGraph.Append("\"");

                    if (transition.FromState.IsSuperState)
                    { dotGraph.Append($" ltail=cluster_{transition.FromState.State}"); }

                    if (transition.ToState.IsSuperState)
                    { dotGraph.Append($" lhead=cluster_{transition.ToState.State}"); }

                    dotGraph.AppendLine("];");
                }
            }

            dotGraph.AppendLine("}");

            return dotGraph.ToString();
        }

        private static void exportSuperStates(IEnumerable<StateDetails<TState, TTrigger>> stateDetails, StringBuilder dotGraph, int level)
        {
            foreach (var state in stateDetails)
            {
                dotGraph.AppendLine();
                dotGraph.AppendLine($"{createIndent(level + 1)}subgraph cluster_{state.State} {{");
                dotGraph.AppendLine($"{createIndent(level + 2)}label={state.State};");
                exportSubGraphNode(dotGraph, state);
                exportNonSuperStates(state.SubStates.Where(s => s.IsSuperState == false), dotGraph, level: level + 1);
                exportSuperStates(state.SubStates.Where(s => s.IsSuperState), dotGraph, level + 1);
                dotGraph.AppendLine($"{createIndent(level + 1)}}}");
            }
        }

        private static void exportSubGraphNode(StringBuilder dotGraph, StateDetails<TState, TTrigger> state)
        {
            dotGraph.Append($"{createIndent(state.StateLevel + 1)}{state.State} ");
            dotGraph.AppendLine(state.TransitionsFrom.Any(t => t.ToState?.SuperState == state)
                ? "[shape=circle label=\"\" style=filled color=black]"
                : "[shape=point color=white];");
        }

        private static string createIndent(int level)
        {
            var indent = string.Empty;
            for(var i = 0; i < level; i++)
            { indent += "\t"; }

            return indent;
        }

        private static void exportNonSuperStates(IEnumerable<StateDetails<TState, TTrigger>> stateDetails, StringBuilder dotGraph, int level)
        {
            var stateDetailsArray = stateDetails as StateDetails<TState, TTrigger>[] ?? stateDetails.ToArray();

            if (!stateDetailsArray.Any())
            { return; }

            dotGraph.AppendLine();

            foreach (var state in stateDetailsArray)
            { dotGraph.AppendLine($"{createIndent(level + 1)}{state.State};"); }
        }
    }
}