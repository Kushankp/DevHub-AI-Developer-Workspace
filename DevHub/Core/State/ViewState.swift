import Foundation

enum ViewState<Value: Equatable>: Equatable {
    case idle
    case loading
    case loaded(Value)
    case empty
    case failed(DisplayError)
}

struct DisplayError: Equatable, Sendable {
    let title: String
    let message: String

    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
