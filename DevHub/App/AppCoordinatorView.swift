import SwiftUI
import DevHubCore

struct AppCoordinatorView: View {
    let environment: AppEnvironment
    @State private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            DashboardView()
                .navigationDestination(for: AppRoute.self) { route in
                    destination(for: route)
                }
        }
        .environment(\.appEnvironment, environment)
        .environment(coordinator)
    }

    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .dashboard:
            DashboardView()
        case .settings:
            SettingsView()
        }
    }
}
