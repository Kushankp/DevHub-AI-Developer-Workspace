import SwiftUI
import DevHubCore

private struct AppEnvironmentKey: EnvironmentKey {
    static let defaultValue = AppEnvironment(
        configuration: AppConfiguration(
            githubRedirectScheme: "devhub"
        )
    )
}

extension EnvironmentValues {
    var appEnvironment: AppEnvironment {
        get { self[AppEnvironmentKey.self] }
        set { self[AppEnvironmentKey.self] = newValue }
    }
}
