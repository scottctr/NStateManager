# Features
- Simple interface so it's easy to use
- State management and processing are decoupled to make configuration intuitive and flexible
- Stateless so it's thread safe and a single instance can be used for instance of the managed entity
- Full async/await support, including cancellation and ConfigureAwait
- Lots of options for defining what happens when triggers occur and when entering, reentering, or exiting states

# Background
This project is inspired by [Stateless](https://github.com/dotnet-state-machine/stateless). Stateless is a great state manager that many have used successfully. Unfortunately, it's foundational model doesn't meet all needs. Many of today's solutions are cloud-based where objects only live long enough to process a single request. Since Stateless' state machines are bound to a single object, it leads to extra overhead for high-transaction solutions with short-lived objects.

Given the foundational mismatch, it was time to consider a new solution. I started reviewing various state management products, related design patterns, forums, academic papers, etc. and set the following goals:
- Be simple and intuitive to use for simple use cases
- Be flexible enough to adapt to complex use cases and changing requirements with minimal rework
- Adhere to SOLID design principles

I would appreciate feedback, questions, advice, and contributions. I'm a big believer that WE are smarter than ME and we can work together to create something that will add value to virtually any .Net application.

# Getting Started: POS v1
Let's start working through an example and see how well we're aligning to our goals. Our example will be managing the Sale component of a point-of-sale (POS) system used by grocery stores, fuel stations, restaurants -- virtually any sales environment. We'll start simple and add in some complexity as we go. Not all details will be included here, but you can get the complete solution in the [Sale.Console example](https://github.com/scottctr/NStateManager/blob/master/Examples/NStateManager.Example.Sale.Console).

In the first version of our POS, we'll only be able to add items to our sale and pay for them. Sales will start in an Open state and then move to a Complete state once fully paid for.

![POSv1](https://github.com/scottctr/NStateManager/blob/master/Examples/NStateManager.Example.Sale.Console/POSv1.png)

You can use any IComparable to represent your states, but we'll use an enum for this example:

```C#
public enum SaleState { Open, Complete }
```

The state machine also needs to be involved in the actions that can affect the state of the object being managed. This may not make sense yet, but will become clear as we work through the example. At this point, our system only allows adding items to the sale and paying, so we'll use an enum to represent those events (i.e. triggers for state changes):

```C#
public enum SaleEvent { AddItem, Pay }
```

## Create and configure a StateMachine 
With the states and events defined, we can create and configure our state machine:

```C#
_stateMachine = new StateMachine<Sale, SaleState, SaleEvent>(
  stateAccessor: (sale) => sale.State
  ,stateMutator: (sale, state) => sale.State = state);
```

Notice the 3 generic types defined with our `StateMachine`
1. Sale (`T`) is the type of objects being managed
2. SaleState (`TState`) is the type used for the possible states. (NOTE: Must be IComparable)
3. SaleEvent (`TTrigger`) is the type used for the triggers (i.e. events) that can lead to a change in state.

There are 2 parameters required by the constructor:
- `stateAccessor` is a function to get the current state of an object
- `stateMutator` is an action to set the state when it's updated

### Configure states
Now that we have a state machine, let's configure it -- starting with the Open state

```C#
_stateMachine.ConfigureState(SaleState.Open)
  .AddTriggerAction<SaleItem>(SaleEvent.AddItem, (sale, saleItem) => {
      sale.AddItem(saleItem);
      Output.WriteLine($"{saleItem.Name} added for {saleItem.Price:C}. Balance {sale.Balance:C}"); })
  .AddTriggerAction<Payment>(SaleEvent.Pay, (sale, payment) => {
      sale.AddPayment(payment);
      Output.WriteLine($"Payment of {payment.Amount:C} added. Balance {sale.Balance:C}"); })
  .AddTransition(SaleEvent.Pay, SaleState.Complete, sale => sale.Balance == 0);
```

`AddTriggerAction` tells the state machine what action to perform when an event occurs.
1. When initiating the addition of an item to the sale, it's added to the sale and a summary is printed.
2. When initiating a payment, it's added to the sale and a summary is printed.

`AddTransition` defines when to transition to a new state. Our example transitions from Open to Complete if the payment causes the sale's balance to go to 0.

We used `StateConfiguration.AddTriggerAction` on the Open state so the 'action' will only occur for the AddItem and Pay events if the sale is in the Open state. Use `StateMachine.AddTriggerAction` to execute an actions across all states. Also note that the second parameter of the action is optional, but it's required here because we defined `TRequest` as SaleItem and Payment on `AddTriggerAction`. In a latter version, we'll have a trigger action to cancel a sale, which will be on the `StateMachine` and not include a `TRequest`.

That does it for the Open state, so let's consider the Complete state. Complete is the final state in this version, so there's nothing to configure. We don't want to take any further actions or transition to any other states. For completeness and to allow me to introduce another feature, let's print a message when a sale enters the Complete state

```C#
_stateMachine.ConfigureState(SaleState.Complete).AddEntryAction(_ => Output.WriteLine("Sale is complete"));
```

`AddEntryAction` allows you to define an action to take when an object enters a state. Here, we're just printing a message to confirm the sale made it to the Complete state. 

## Use the configured StateMachine
Our state machine is fully configured for our current requirements, so let's see how to use it

```C#
public static void AddItem(Sale sale, SaleItem saleItem)
{ 
  _stateMachine.FireTrigger(sale, SaleEvent.AddItem, saleItem); 
}

public static void AddPayment(Sale sale, Payment payment)
{ 
  _stateMachine.FireTrigger(sale, SaleEvent.Pay, payment);
}
```

`StateMachine.FireTrigger` is how it all comes together. The first parameter is the managed object. The second parameter is the trigger (or event) that's occuring. And the third parameter is the details of the event that's occuring. Note that you will not use the third parameter if you didn't define a parameter type (`TRequest`) on the associated call to `AddTriggerAction`. You'll also see that I've wrapped the FireTrigger calls in methods on a static class to expose the state machine to our application.

Now let's create a simple test case and look at the output

```C#
static void Main(string[] args)
{
  var sale = new Sale();
  SaleStateMachine.AddItem(sale, new SaleItem("SodaPop", 1.00));
  SaleStateMachine.AddItem(sale, new SaleItem("Chips", 1.00));
  SaleStateMachine.AddPayment(sale, new Payment(2.00));
  //We should be in Complete state here, so the following actions should be ignored
  SaleStateMachine.AddItem(sale, new SaleItem("Magazine", 3.00));
  SaleStateMachine.AddItem(sale, new SaleItem("Fuel", 10.00));
}
```

```
SodaPop added for $1.00. Balance $1.00
Chips added for $1.00. Balance $2.00
Payment of $2.00 added. Balance $0.00
Sale is complete
```

The output confirms our configuration was correct:
1. Added 2 items to give us a balance of $2.00
2. Made a payment of $2.00 to bring the balance $0
3. Sale state transitioned to the Complete state

# POS v2
Continuing with the POS example, it's time to define the next version.
...

## Still lots to do to get this rolling, so here's the current to-do list in priority order
- Create Nuget package
  -- badge
- AppVeyor
  -- badge
- Finish this readme
- Publish Sale.Console example
- Finish unit tests
- Create event to notify when transitions occur
- Lots of documentation
- More examples and docs...
  -- Phone example
  -- Walk/Jump/Run example
  -- SOLID/Head First example
  -- Async example

Please take a look around and post questions, suggestions, and advice to Issues. Also let me know if you're interested in contributing.
