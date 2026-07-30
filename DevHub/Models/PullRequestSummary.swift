import Foundation

struct PullRequestSummary: Identifiable, Hashable, Sendable {
    let id: String
    let number: Int
    let title: String
    let authorLogin: String
    let repositoryNameWithOwner: String
    let reviewDecision: ReviewDecision
    let updatedAt: Date
}

enum ReviewDecision: String, Hashable, Sendable {
    case approved = "APPROVED"
    case changesRequested = "CHANGES_REQUESTED"
    case reviewRequired = "REVIEW_REQUIRED"
    case unknown
}
