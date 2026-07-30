import SwiftUI
import DevHubCore

@main
struct DevHubApp: App {
    private let environment = AppEnvironment.bootstrap()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(environment: environment)
        }
    }
}
