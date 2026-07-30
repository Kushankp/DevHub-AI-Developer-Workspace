import SwiftUI

struct LoadingStateView<Content: View>: View {
    let isLoading: Bool
    @ViewBuilder var content: Content

    var body: some View {
        content
            .redacted(reason: isLoading ? .placeholder : [])
            .animation(.snappy, value: isLoading)
            .accessibilityHidden(isLoading)
    }
}
