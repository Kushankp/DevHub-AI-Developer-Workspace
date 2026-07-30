import Foundation
import DevHubCore

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let dependencies = DependencyContainer()
        let bundle = Bundle.main
        let configurationReader = ConfigurationReader(values: bundle.devHubConfigurationValues)
        let logger = AppLogger(category: .configuration)

        if configurationReader.string(for: "GitHubClientID") == nil {
            logger.info("GitHub OAuth client ID is not configured")
        }

        return AppEnvironment(
            dependencies: dependencies,
            configuration: AppConfiguration(
                githubClientID: configurationReader.string(for: "GitHubClientID"),
                githubRedirectScheme: configurationReader.string(for: "GitHubRedirectScheme") ?? "devhub",
                apiBaseURL: (try? configurationReader.url(for: "GitHubGraphQLURL")) ?? AppConfiguration.githubGraphQLURL
            )
        )
    }
}

private extension Bundle {
    var devHubConfigurationValues: [String: String] {
        [
            "GitHubClientID": object(forInfoDictionaryKey: "GitHubClientID") as? String ?? "",
            "GitHubRedirectScheme": object(forInfoDictionaryKey: "GitHubRedirectScheme") as? String ?? "",
            "GitHubGraphQLURL": object(forInfoDictionaryKey: "GitHubGraphQLURL") as? String ?? ""
        ]
    }
}
