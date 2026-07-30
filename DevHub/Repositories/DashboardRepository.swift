import Foundation

protocol DashboardRepository: Sendable {
    func loadDashboard() async throws -> DashboardSnapshot
}

struct DashboardSnapshot: Equatable, Sendable {
    let repositories: [RepositorySummary]
    let recentPullRequests: [PullRequestSummary]
    let openIssueCount: Int
    let assignedReviewCount: Int
}
