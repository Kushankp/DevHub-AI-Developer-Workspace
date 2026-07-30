import Foundation

@MainActor
protocol AsyncViewModel: AnyObject {
    associatedtype Output: Equatable

    var state: ViewState<Output> { get set }

    func load() async
}
