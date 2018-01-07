using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NStateManager.Example.Sale.Console
{
    public class SaleItem
    {
        public string Name { get; }
        public double Price { get; }

        public SaleItem(string name, double price)
        {
            Name = name;
            Price = price;
        }
    }
}
