import Foundation
import DevHubCore

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let dependencies = DependencyContainer()
        let bundle = Bundle.main

        return AppEnvironment(
            dependencies: dependencies,
            configuration: AppConfiguration(
                githubClientID: bundle.object(forInfoDictionaryKey: "GitHubClientID") as? String,
                githubRedirectScheme: bundle.object(forInfoDictionaryKey: "GitHubRedirectScheme") as? String ?? "devhub"
            )
        )
    }
}
