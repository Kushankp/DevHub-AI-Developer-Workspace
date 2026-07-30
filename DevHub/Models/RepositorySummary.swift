import Foundation

struct RepositorySummary: Identifiable, Hashable, Sendable {
    let id: String
    let owner: String
    let name: String
    let description: String?
    let primaryLanguage: String?
    let stargazerCount: Int
    let openIssueCount: Int
}
