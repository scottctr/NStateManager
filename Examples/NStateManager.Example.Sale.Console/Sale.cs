using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NStateManager.Example.Sale.Console
{
    public enum SaleState
    {
        Open,
        Complete
    }

    public enum SaleEvent
    {
        AddItem,
        Pay
    }

    public class Sale
    {
        public double Balance { get; private set; }
        public List<SaleItem> Items { get; } = new List<SaleItem>();
        public List<Payment> Payments { get; } = new List<Payment>();
        public SaleState State { get; set; }

        public void AddItem(SaleItem item)
        {
            Items.Add(item);
            updateBalance();
        }

        public void AddPayment(Payment payment)
        {
            Payments.Add(payment);
            updateBalance();
        }

        private void updateBalance()
        {
            Balance = Items.Sum(item => item.Price) - Payments.Sum(payment => payment.Amount);
        }
    }
}
