import SwiftUI
import DevHubCore

struct AppCoordinatorView: View {
    let environment: AppEnvironment

    var body: some View {
        NavigationStack {
            DashboardView()
        }
        .environment(\.appEnvironment, environment)
    }
}
