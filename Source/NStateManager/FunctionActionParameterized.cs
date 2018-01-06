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
    internal class FunctionActionParameterized<T, TRequest> : FunctionActionBase<T>
    {
        internal Func<T, TRequest, CancellationToken, Task> Action { get; }

        internal FunctionActionParameterized(Func<T, TRequest, CancellationToken, Task> action)
        {
            Action = action ?? throw new ArgumentNullException(nameof(action));
        }

        internal override async Task ExecuteAsync(T context, object request, CancellationToken cancellationToken)
        {
            if (!(request is TRequest typedRequestType))
            { throw new ArgumentException($"{nameof(request)} must be of type {typeof(TRequest).Name}.");}

            await Action.Invoke(context, typedRequestType, cancellationToken).ConfigureAwait(continueOnCapturedContext: false);
        }
    }
}