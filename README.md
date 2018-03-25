[![Build status](https://ci.appveyor.com/api/projects/status/byg4n228cinno4xt?svg=true)](https://ci.appveyor.com/project/ScottCarter/nstatemanager) [![NuGet Status](https://img.shields.io/nuget/v/NStateManager.svg)](https://www.nuget.org/packages/NStateManager)
# Features
- Simple interface so it's easy to use
- State management and processing are decoupled to make configuration intuitive and flexible
- Stateless so it's thread safe and a single state machine can be used to manage state for all [contexts](https://github.com/scottctr/NStateManager/wiki/Terminology#context)
- Full async/await support, including cancellation and ConfigureAwait
- Lots of options for defining what happens when events occur and when entering, reentering, or exiting states

# Background
This project is inspired by [Stateless](https://github.com/dotnet-state-machine/stateless). Stateless is a great state manager that many have used successfully. Unfortunately, it's foundational model doesn't meet all needs. Many of today's solutions are cloud-based where objects only live long enough to process a single request. Since Stateless' state machines can only be bound to a single context, it leads to workarounds or extra overhead for high-transaction solutions with short-lived objects.

Given the foundational mismatch, it was time to consider a new solution. I started reviewing various state management products, related design patterns, forums, academic papers, etc. and set the following goals:
- Be simple and intuitive to use for simple use cases
- Be flexible enough to adapt to complex use cases and changing requirements with minimal rework
- Adhere to SOLID design principles

I would appreciate feedback, questions, advice, and contributions. I'm a big believer that WE are smarter than ME and we can work together to create something that will add value to virtually any .Net application.

## Try it out
If you're ready to jump in, go to the [Quick Start](https://github.com/scottctr/NStateManager/wiki/Quick-Start).

Please take a look around and post questions, suggestions, and advice to [Issues](https://github.com/scottctr/NStateManager/issues). Also let me know if you're interested in contributing.
