# WeatherApp

This app was developed for the Faire Take Home Project. It is a weather app that displays basic weather information for a given location. 

## Running

You should be able to open the Workspace and run the App main target. 

You can run tests in the primary target, which will run all tests, or pick the target you want to run only the tests related to that target.

## Organization 

### Dependencies

The app dependencies are managed using Swift Package Manager. 

Each package has two targets, one as the implementation target, where the concrete implementations are made, and another as an interface target, which exposes the package's public declarations to other packages. You can read more about interface modules [here](https://www.runway.team/blog/how-to-improve-ios-build-times-with-modularization).

This helps us inject modules into each other but only depending on the interfaces. Only the main app will depend on the implementation targets and is responsible for resolving the dependency injection by using a DependencyContainer.

### Scenes

I define a Scene as the combination of all architectural design parttern components used to define a whole Screen. In the case of this project, I chose the VIP architecture. 

I decided to go with it because it better helps separate formatting logic from business when compared to MVVM, which later helps in unit testing.

The trade-off here is that VIP has a lot more boilerplate code, which might be overkill for this simple case. But the trade-off was beneficial due to the clean tests.

## Copied code or 3rd parties.

I did not use any 3rd party code. 

I've copied the code located at the `WeatherService` packaged in the `Core` folder. I had that already done in other projects and just copied that so I could cleanly write the Repository code.

Also, in the unit tests, I've had ChatGPT help me create the TestDoubles and Unit Tests, even though I had to review and rewrite a lot of them to work correctly. I took the opportunity of this test to try out ChatGPT as a productivity tool for programming. 