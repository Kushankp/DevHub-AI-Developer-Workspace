import Foundation

protocol DashboardRepository: Sendable {
    func loadDashboard() async throws -> DashboardSnapshot
}

struct DashboardSnapshot: Equatable, Sendable {
    let repositories: [RepositorySummary]
    let recentPullRequests: [PullRequestSummary]
    let openIssueCount: Int
    let assignedReviewCount: Int

    init(
        repositories: [RepositorySummary],
        recentPullRequests: [PullRequestSummary],
        openIssueCount: Int,
        assignedReviewCount: Int
    ) {
        self.repositories = repositories
        self.recentPullRequests = recentPullRequests
        self.openIssueCount = openIssueCount
        self.assignedReviewCount = assignedReviewCount
    }
}
