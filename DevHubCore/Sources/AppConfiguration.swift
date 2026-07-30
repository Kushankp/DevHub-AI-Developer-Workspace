import Foundation

public struct AppConfiguration: Equatable, Sendable {
    public let githubClientID: String?
    public let githubRedirectScheme: String
    public let apiBaseURL: URL

    public init(
        githubClientID: String? = nil,
        githubRedirectScheme: String,
        apiBaseURL: URL = URL(string: "https://api.github.com/graphql")!
    ) {
        self.githubClientID = githubClientID
        self.githubRedirectScheme = githubRedirectScheme
        self.apiBaseURL = apiBaseURL
    }
}
