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
