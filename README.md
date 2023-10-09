# ViewState

An extension that provides essential state modifiers to SwiftUI views.

## Overview

`ViewState` is a SwiftUI extension that introduces state modifiers to manage common view states. `ViewState` simplifies the process of displaying loaders, representing empty states and showcasing errors.

## Installation

You can add `ViewState` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/ViewState.git", .upToNextMajor(from: "1.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/ViewState.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.

## Usage

```swift
import SwiftUI
import ViewState

struct Example: View {
    @State private var viewState: ViewState? = .loading

    var body: some View {
        VStack {
            Text("This is the main content.")
        }
        .when(viewState, is: .loading) {
            VSLoadingView()
        }
        .when(viewState, is: .empty) {
            VSPlaceholderView(title: "No Data", subtitle: "There is no data to display.") {
                Button("Add Data") {
                    // Add data
                }
            }
        }
        .when(viewState, is: .error) {
            VSPlaceholderView(title: "Error", subtitle: "An error has occurred.") {
                Button("Retry") {
                    // Retry
                }
            }
        }
    }
}
```

## License

[MIT License](/LICENSE)
