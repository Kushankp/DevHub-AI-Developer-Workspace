import Foundation

@Observable
@MainActor
final class DashboardViewModel: AsyncViewModel {
    typealias Output = DashboardSnapshot

    var state: ViewState<DashboardSnapshot> = .idle

    private let repository: any DashboardRepository
    private let errorMapper: any ErrorMapping

    init(
        repository: any DashboardRepository,
        errorMapper: any ErrorMapping = DefaultErrorMapper()
    ) {
        self.repository = repository
        self.errorMapper = errorMapper
    }

    func load() async {
        state = .loading

        do {
            let snapshot = try await repository.loadDashboard()
            state = snapshot.isEmpty ? .empty : .loaded(snapshot)
        } catch {
            state = .failed(errorMapper.displayError(from: error))
        }
    }
}
