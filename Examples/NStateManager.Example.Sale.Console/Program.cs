namespace NStateManager.Example.Sale.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            var sale = new Sale();
            SaleStateMachine.AddItem(sale, new SaleItem("SodaPop", 1.00));
            SaleStateMachine.AddItem(sale, new SaleItem("Chips", 1.00));
            SaleStateMachine.AddPayment(sale, new Payment(2.00));
            //We should be in a Complete state here, so the following actions should be ignored
            SaleStateMachine.AddItem(sale, new SaleItem("Magazine", 3.00));
            SaleStateMachine.AddItem(sale, new SaleItem("Fuel", 10.00));

            System.Console.Read();
        }
    }
}

