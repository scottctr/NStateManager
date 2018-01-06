# NStateManager
Easy to use and very flexible state manager for .Net.

Features
- Simple interface so it's easy to get started
- State management and trigger/event processing are decoupled to simplify configuration
- Stateless so it can be used as a shared resource or embedded as part of managed entity
- Full async/await support, including cancellation and ConfigureAwait
- Lots of options for defining what happens when triggers/events occur and entering, reentering, or exiting states

Getting Started
Let's start walking through an example to see those features. Our example will be managing the Sale component of a point-of-sale (POS) system used by grocery stores, fuel stations, restaurants -- virtually any sales environment. We'll start simple and add in some complexity as we go.

In the first version of our POS, we're only going to be able to add items to our sale and pay for them. Sales will start in an Open state and then move to a Complete state once fully paid for. You can use any IComparable to represent your states, but we'll use an enum for this example:

```C#
public enum SaleState
{
  Open,
  Complete
}
```

The state machine also needs to be involved in the application behaviors that can affect the state of the object being managed. This may not make sense yet, but will become clear as we work through the example. At this point, our system only allows adding items to the sale and paying, so we'll use an enum to represent those actions:

```C#
public enum SaleEvent
{
  AddItem,
  Pay
}
```

With the states and events defined, we can create and configure our state machine:

```C#
_stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(
  stateAccessor: (sale) => sale.State
  ,stateMutator: (sale, state) => sale.State = state);
```

Notice the 3 types defined by the type: Sale, SaleState, and SaleEvent. These define:
1. Sale is the type of objects being managed
2. SaleState is the type used for the possible states. (NOTE: Must be IComparable)
3. SaleEvent is the type used for the triggers (i.e. events) that can change the state of the objects.

There are also 2 parameters required by the constructor:
- stateAccessor is a function to get the current state of an object
- stateMutator is an action to set the state when it's updated

Now that we have a state machine, let's configure it -- starting with the Open state

```C#
_stateMachine.ConfigureState(SaleState.Open)
  .AddTriggerAction<SaleItem>(SaleEvent.AddItem, (sale, saleItem) =>
    {
      sale.AddItem(saleItem);
      Output.WriteLine($"{saleItem.Name} added for {saleItem.Price:C}. Balance {sale.Balance:C}");
    })
  .AddTriggerAction<Payment>(SaleEvent.Pay, (sale, payment) =>
    {
      sale.AddPayment(payment);
      Output.WriteLine($"Payment of {payment.Amount:C} added. Balance {sale.Balance:C}");
    })
  .AddTransition(SaleEvent.Pay, SaleState.Complete, sale => sale.Balance == 0);
```

AddTriggerAction tells the state machine how to process the events that may affect our state:
1. When the clerk initiates adding an item to the sale, we process it by adding it to the sale and print a summary of the item and the current balance.
2. When the clerk or customer initiates payment for the sale, we process it by adding it to the sale and print a message about the payment with the current balance

AddTransition tells the state machine when to transition to a new state. In our case, we check to see if we can move from Open to Complete when a payment is made...but we only make the transition if the sale's balance is 0.

That's all we currently need for the Open state, so let's consider the Complete state. Complete is the final state in this version, so there's really nothing to configure. Since we defined the AddItem and Pay actions on Open state, they are totally ignored if they occur while in the Complete state -- no items or payments will be added to the sale and no other transitions will occur.

For completeness of the example and to allow me to introduce another feature, let's print a message when a sale enters the Complete state

```C#
_stateMachine.ConfigureState(SaleState.Complete)
  .AddEntryAction(_ => Output.WriteLine("Sale is complete"));
```

AddEntryAction allows you to define an action to take whenever your object enters the state. Here we're just printing a message to confirm we're in the Complete state. There's an overload of this method where you can specify to only perform an action when coming from a specific previous state. You can also define actions when exiting or reentering a state.

Still lots to do to get this rolling, so here's the current to-do list in priority order
- Finish Sale example
- Finish unit tests
- Finish this readme
- Create Nuget package
- Lots of documentation
- More examples and docs...

Please take a look around and post questions, suggestions, and advice to Issues. Also let me know if you're interested in contributing.
