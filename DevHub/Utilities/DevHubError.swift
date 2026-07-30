import Foundation

enum DevHubError: LocalizedError, Equatable, Sendable {
    case unauthenticated
    case invalidResponse
    case configurationMissing(String)

    var errorDescription: String? {
        switch self {
        case .unauthenticated:
            "Sign in to continue."
        case .invalidResponse:
            "The server returned an invalid response."
        case let .configurationMissing(key):
            "Missing configuration value: \(key)."
        }
    }
}
