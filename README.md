# Stance Fitness Test
#### 2 hour taken home test for Stance Fitness
by Simon Hopkin - 24th August 2024 - 10:04am - 12:04pm

## Implementation Decisions

- UIKit: due to my limited SwiftUI experience and time allowed.  Obviously the view side of this project would be much more succinct had it been done in SwiftUI.
- DGCharts: to display the speed vs reps as line graphs for each set
- Combine: used to implement observer pattern to bind view model attributes to view components.  In the past I have normally used RxSwift but opted to go with Combine as its only used lightly here and I figured I could work it out in the allotted time.
- Swift Package Manager: Historically used Cocoapods, but gave SPM a whirl and I liked it.

## App Design

- API layer - responsible for communicate with the stance backend to retrieve data such as Workout Session
- Service layer - layer of abstraction between the view models and api layer which will also host any business logic required
- MVVM - using view models to reduce the amount of code in the view to display logic only.
- Views - using interface builder might have saved me some time but I opted to do all the views in code.
- Protocols - coded to interfaces to ensure testability
- Localisation - all displayed strings in Localisation strings file

## Build Instructions

- open StanceFitnessTest.xcodeproj in Xcode
- wait for DGCharts dependency to load
- run in the simulator or on an iOS device.

I have tested using a simulator of iPhone 15 (iOS 17.5) and a real iPhone 15 (17.5.1)

## More Time

If I had more time I would do the following:
- Refine the views, It was a bit of a rush and I didn't leave myself much time to tidy things in this area.
- Refine the charts
- Improve unit testing
- Commenting the code, and improving self documentation
