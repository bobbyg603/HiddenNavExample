# HiddenNavExample
SwiftUI example of programmatic only navigation. I couldn't find an example that demonstrates how to add validation before pushing a view to the NavigationStack so I built one myself.

## Code 🧑‍💻
```swift
struct ContentView: View {
  @State private var showResult = false
  var body: some View {
    NavigationStack {
      NavigationLink("Result", value: "result")
        .hidden()
        .navigationDestination(isPresented: $showResult) {
            ResultView()
        }
    }
  }
}
```

## Preview 🎥
<img alt="Hidden NavigationLink Example" height="800px" src="https://user-images.githubusercontent.com/2646053/209444413-0eba5751-d22c-4922-8d74-73ed24b9ac01.gif">
