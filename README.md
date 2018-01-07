# NStateManager
Easy to use and very flexible state manager for .Net.

# Features
- Simple interface so it's easy to get started
- State management and trigger/event processing are decoupled to simplify configuration
- Stateless so it can be used as a shared resource or embedded as part of a managed entity
- Full async/await support, including cancellation and ConfigureAwait
- Lots of options for defining what happens when triggers/events occur and entering, reentering, or exiting states

# Background
This project is inspired by [Stateless](https://github.com/dotnet-state-machine/stateless). Stateless is a great state manager that I've used successfully in a point-of-sale system, but is based on a foundationally different model than we need for our system. Each instance of Stateless' state machine is bound to a specific object, which is OK if your objects have a long lifespan and go through multiple actions and state changes. Our system is a cloud-based system and each instance only lives long enough to execute a single request (add item, add payment, etc.) so Stateless required constructing a new instance of the state machine each time we processed a request on the server. It's just more efficient to have a single state machine we can use for all objects on our server.

Given the foundational difference, I decided to start from scratch. So I started reviewing various state management products, related design patterns, forums, academic papers, etc. and set the following goals:
- Be simple and intuitive to use for simple use cases
- Be flexible enough to adapt to complex use cases and changing requirements with minimal rework
- Adhere to SOLID design principles

I would appreciate feedback, questions, advice, and contributions. I'm a big believer that WE are smarter than ME and we can work together to create something that will add value to most any .Net application.

# Getting Started
Let's start working through an example to see those features in action and see how well we're aligning to our goals. Our example will be managing the Sale component of a point-of-sale (POS) system used by grocery stores, fuel stations, restaurants -- virtually any sales environment. We'll start simple and add in some complexity as we go.

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
3. SaleEvent (`TTrigger`) is the type used for the triggers (i.e. events) that can change the state of the objects.

There are also 2 parameters required by the constructor:
- `stateAccessor` is a function to get the current state of an object
- `stateMutator` is an action to set the state when it's updated

### Configure states
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

`AddTriggerAction` tells the state machine how to process the events that may affect the object's state:
1. When the clerk initiates adding an item to the sale, we process it by adding it to the sale and print a summary of the item and the current balance.
2. When the clerk or customer initiates payment for the sale, we process it by adding it to the sale and print a message about the payment with the current balance

`AddTransition` tells the state machine when to transition to a new state. In our case, we check to see if we can move from Open to Complete when a payment is made...but we only make the transition if the sale's balance is 0.

Couple of notes on `AddTriggerAction` to help paint the big picture. We've used `AddTriggerAction` on a specific state. If you need to execute the same or similar actions across most all of your states, you can use the same method on `StateManager` and handle any state differences in the action. Also note that the second parameter of the action is optional. It's only available because we included SaleItem and Payment for `TRequest` on our call to `AddTriggerAction`. In a latter version, we'll in have a trigger action for cancelling a sale, which will likely be on the `StateMachine` and not include a `TRequest`.

That's all we currently need for the Open state, so let's consider the Complete state. Complete is the final state in this version, so there's really nothing to configure. Since we defined the AddItem and Pay actions on Open state, they are totally ignored if they occur while in the Complete state -- no items or payments will be added to the sale and no other transitions will occur.

For completeness of the example and to allow me to introduce another feature, let's print a message when a sale enters the Complete state

```C#
_stateMachine.ConfigureState(SaleState.Complete)
  .AddEntryAction(_ => Output.WriteLine("Sale is complete"));
```

`AddEntryAction` allows you to define an action to take whenever your object enters the state. Here we're just printing a message to confirm we're in the Complete state. There's an overload of this method where you can specify to only perform an action when coming from a specific previous state. You can also define actions when exiting or reentering a state.

## Use the configured StateMachine
We're fully configured for our current requirements, so let's see how to put this thing to use

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

The 'FireTrigger' method on the `StateMachine` is how it all comes together. The first parameter is the context (i.e. instance of the type being managed). The second parameter is the trigger (or event) that's occuring. And the third parameter is the details of the event that's occuring. Note that you will not use the third parameter if you didn't define a parameter type (`TRequest`) on the calls to `AddTriggerAction`. You'll also see that I've wrapped the FireTrigger calls in methods on a static class to expose them.

Now let's see a simple test case and the output

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

## Still lots to do to get this rolling, so here's the current to-do list in priority order
- Create Nuget package
- Finish this readme
- Publish Sale.Console example
- Finish unit tests
- Create event to notify when transitions occur
- Lots of documentation
- More examples and docs...
  -- Phone example
  -- Walk/Jump/Run example
  -- SOLID/Head First example
  -- 

Please take a look around and post questions, suggestions, and advice to Issues. Also let me know if you're interested in contributing.
