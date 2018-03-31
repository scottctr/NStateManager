[![Build status](https://ci.appveyor.com/api/projects/status/byg4n228cinno4xt?svg=true)](https://ci.appveyor.com/project/ScottCarter/nstatemanager) [![NuGet Status](https://img.shields.io/nuget/v/NStateManager.svg)](https://www.nuget.org/packages/NStateManager) ![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=NStateManager&metric=security_rating) ![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=NStateManager&metric=reliability_rating) ![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=NStateManager&metric=sqale_rating)
# Background and Goals  
This project was created while developing cloud-based solutions. We needed a state management solution made for our stateless services.  
- **Stateless** so it's thread safe and a single state machine can be used to manage state for all managed instances  
- **Intuitive configuration** of [state change conditions](https://github.com/scottctr/NStateManager/wiki/Changing-States), [behaviors based on current state](https://github.com/scottctr/NStateManager/wiki/Event-Actions), and [actions when changing states](https://github.com/scottctr/NStateManager/wiki/State-Change-Actions)  
- **[async/await support](https://github.com/scottctr/NStateManager/wiki/Async-Await-Support)**, including cancellation and ConfigureAwaitthat was performant 

I would appreciate feedback, questions, advice, and contributions. I'm a big believer that WE are smarter than ME and we can work together to create something that will add value to virtually any .Net application.

## Try it out
If you're ready to jump in, go to the [Quick Start](https://github.com/scottctr/NStateManager/wiki/Quick-Start).

Please take a look around and post questions, suggestions, and advice to [Issues](https://github.com/scottctr/NStateManager/issues). Also let me know if you're interested in contributing.
