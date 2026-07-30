import Foundation

protocol ErrorMapping: Sendable {
    func displayError(from error: Error) -> DisplayError
}

struct DefaultErrorMapper: ErrorMapping {
    func displayError(from error: Error) -> DisplayError {
        if let localizedError = error as? LocalizedError,
           let description = localizedError.errorDescription {
            return DisplayError(title: "Unable to Load", message: description)
        }

        return DisplayError(
            title: "Unable to Load",
            message: "Check your connection and try again."
        )
    }
}
