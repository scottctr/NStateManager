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
using NStateManager.Export;
using System;
using System.Linq;

// ReSharper disable once CheckNamespace
namespace NStateManager.Sync
{
    public sealed partial class StateMachine<T, TState, TTrigger> where TState : IComparable
    {
        public ConfigurationSummary<TState, TTrigger> GetSummary()
        {
            var result = new ConfigurationSummary<TState, TTrigger>();

            addNonConfiguredStates(result);
            // Build a list of stateDetails
            var stateDetailsByState = _stateConfigurations.ToDictionary(config => config.Key, config => result.AddState(config.Key));

            foreach (var stateConfig in _stateConfigurations)
            {
                var fromStateDetails = stateDetailsByState[stateConfig.Key];

                if (stateConfig.Value.IsSubState())
                { fromStateDetails.AddSuperState(stateDetailsByState[stateConfig.Value.SuperStateConfig.State]); }

                if (!(stateConfig.Value is StateConfigurationBase<T, TState, TTrigger> stateConfigBase))
                { continue; }

                foreach (var transitions in stateConfigBase.Transitions)
                {
                    foreach (var transition in transitions.Value)
                    {
                        fromStateDetails.CreateTransitionFrom(transition.Name
                          , transitions.Key
                          , transition is StateTransitionNonDynamic<T, TState, TTrigger> nonDynamic
                                ? result.StateDetails.First(s => s.State.IsEqual(nonDynamic.ToState))
                                : stateDetailsByState.First().Value
                          , (transition is StateTransition<T, TState, TTrigger> condTransition)
                                && condTransition.HasCondition
                          , transition.Priority
                          , transition is StateTransitionDynamicBase<T, TState, TTrigger>);
                    }
                }

                foreach (var transitions in stateConfigBase.AutoTransitions)
                {
                    foreach (var transition in transitions.Value)
                    {
                        fromStateDetails.CreateTransitionFrom(transition.Name
                          , transitions.Key
                          , transition is StateTransitionNonDynamic<T, TState, TTrigger> nonDynamic
                                ? result.StateDetails.First(s => s.State.IsEqual(nonDynamic.ToState))
                                : stateDetailsByState.First().Value
                          , (transition is StateTransition<T, TState, TTrigger> condTransition)
                         && condTransition.HasCondition
                          , transition.Priority
                          , transition is StateTransitionDynamicBase<T, TState, TTrigger>);
                    }
                }
            }

            setStateLevels(result);

            return result;
        }

        private static void setStateLevels(ConfigurationSummary<TState, TTrigger> configurationSummary)
        {
            foreach (var state in configurationSummary.StateDetails)
            {
                if (!state.IsSuperState)
                { continue; }

                if (state.StateLevel == 0)
                { state.StateLevel = 1; }

                foreach (var subState in state.SubStates)
                { subState.StateLevel = state.StateLevel + 1; }
            }
        }

        private static void addNonConfiguredStates(ConfigurationSummary<TState, TTrigger> summary)
        {
            var dictionaryType = summary.GetType();
            var stateType = dictionaryType.GetGenericArguments().First();

            if (!stateType.IsEnum)
            { return; }

            var enumTypes = Enum.GetValues(stateType);
            foreach (var enumType in enumTypes)
            {
                var realEnumType = (TState) enumType;
                summary.AddState(realEnumType);
            }

            //TODO Non-configured non-enums
        }
    }
}
