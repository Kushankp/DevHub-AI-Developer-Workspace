extension DashboardSnapshot {
    var isEmpty: Bool {
        repositories.isEmpty &&
        recentPullRequests.isEmpty &&
        openIssueCount == 0 &&
        assignedReviewCount == 0
    }
}
