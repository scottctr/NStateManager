﻿#region Copyright (c) 2018 Scott L. Carter
//
//Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in
//compliance with the License. You may obtain a copy of the License at
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software distributed under the License is 
//distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and limitations under the License.
#endregion
namespace NStateManager.Tests
{ 
    public enum SaleState
    {
        Open,
        ChangeDue,
        Complete
    }

    public enum SaleEvent
    {
        AddItem,
        Pay,
        ChangeGiven
    }

    public class Sale
    {
        public double Balance { get; set; }
        public SaleState State { get; set; }
        public int SaleId { get; }

        public Sale(int saleId)
        {
            SaleId = saleId;
        }
    }
}
