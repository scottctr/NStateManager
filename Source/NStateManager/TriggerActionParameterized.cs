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

namespace NStateManager
{
    internal class TriggerActionParameterized<T, TTrigger, TRequest> : TriggerActionBase<T, TTrigger>
    {
        internal Action<T, TRequest> Action { get; }

        internal TriggerActionParameterized(Action<T, TRequest> action)
        {
            Action = action ?? throw new ArgumentNullException(nameof(action));
        }

        internal override void Execute(ExecutionParameters<T, TTrigger> parameters)
        {
            if (parameters == null) { throw new ArgumentNullException(nameof(parameters)); }

            if (!(parameters.Request is TRequest typedRequestType))
            { throw new ArgumentException($"{nameof(parameters.Request)} must be of type {typeof(TRequest).Name}."); }

            Action.Invoke(parameters.Context, typedRequestType);
        }
    }
}