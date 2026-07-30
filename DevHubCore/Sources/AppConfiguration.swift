import Foundation

/// Runtime configuration required by the app shell and service layer.
public struct AppConfiguration: Equatable, Sendable {
    public static var githubGraphQLURL: URL {
        guard let url = URL(string: "https://api.github.com/graphql") else {
            preconditionFailure("GitHub GraphQL URL literal is invalid")
        }

        return url
    }

    public let githubClientID: String?
    public let githubRedirectScheme: String
    public let apiBaseURL: URL

    public init(
        githubClientID: String? = nil,
        githubRedirectScheme: String,
        apiBaseURL: URL = AppConfiguration.githubGraphQLURL
    ) {
        self.githubClientID = githubClientID
        self.githubRedirectScheme = githubRedirectScheme
        self.apiBaseURL = apiBaseURL
    }
}
