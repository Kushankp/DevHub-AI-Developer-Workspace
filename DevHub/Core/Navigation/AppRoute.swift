import Foundation

enum AppRoute: Hashable {
    case dashboard
    case repository(owner: String, name: String)
    case pullRequest(owner: String, repository: String, number: Int)
    case settings
}
