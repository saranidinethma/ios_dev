# MovieGenreFilter — Week 1 Starter Project

This is the clean starting Xcode project for the revised Week 1 MovieGenreFilter tutorial.

## Starting point

The project configuration and folder architecture were derived from the supplied Week 1 solution, while the implementation code has been removed so students can build it by following the tutorial.

The starter contains:

- SwiftUI iOS application project
- `App/MovieGenreFilterApp.swift`
- `Assets.xcassets`
- `Models/`
- `ViewModels/`
- `Views/Screens/`
- `Views/Components/`

## Week 1 tutorial sequence

Students should follow the tutorial to create:

1. `Models/Movie.swift`
2. `Models/MockDataStore.swift`
3. `ViewModels/MovieListViewModel.swift`
4. `Views/Components/SharedComponents.swift`
5. `Views/Components/MovieRowView.swift`
6. `Views/Screens/MovieDetailView.swift`
7. `Views/Screens/MovieListView.swift`
8. Replace the generated app entry-point content in `App/MovieGenreFilterApp.swift` with the tutorial's final `MovieGenreFilterApp.swift`.

The tutorial establishes the MVVM structure, in-memory mock data, reusable components, navigation, detail screen, watched state, and SwiftUI previews.


## Architecture note

The starter is intentionally incomplete: it provides the Xcode project shell and folder structure, but not the Part 1 implementation. The app entry point contains only a temporary `Text` placeholder. Replace its `WindowGroup` content with `MovieListView()` when you reach the app entry-point step in the tutorial.

The project is configured for Swift 6.0 and iOS 26.0. No SwiftData persistence is included in Week 1; persistence is introduced in Part 3.
