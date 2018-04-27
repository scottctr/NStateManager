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
using System.Threading;
using System.Threading.Tasks;

namespace NStateManager
{
    internal static class TriggerActionFactory<T, TTrigger>
    {
        internal static TriggerActionBase<T, TTrigger> GetTriggerAction(Action<T> action)
        {
            return new TriggerAction<T, TTrigger>(action);
        }

        internal static TriggerActionBase<T, TTrigger> GetTriggerAction<TRequest>(Action<T, TRequest> action)
        {
            return new TriggerActionParameterized<T, TTrigger, TRequest>(action);
        }

        internal static FunctionActionBase<T> GetTriggerAction(Func<T, CancellationToken, Task> action)
        {
            return new FunctionAction<T>(action);
        }

        internal static FunctionActionBase<T> GetTriggerAction<TRequest>(Func<T, TRequest, CancellationToken, Task> action)
        {
            return new FunctionActionParameterized<T,TRequest>(action);
        }
    }
}