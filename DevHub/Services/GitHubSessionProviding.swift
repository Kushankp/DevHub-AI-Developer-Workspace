import Foundation

protocol GitHubSessionProviding: Sendable {
    var accessToken: String? { get async }
    func signOut() async throws
}
