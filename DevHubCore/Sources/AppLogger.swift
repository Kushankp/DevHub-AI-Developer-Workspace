import Foundation
import OSLog

/// Namespaced logging facade for DevHub subsystems.
public struct AppLogger: Sendable {
    public enum Category: String, Sendable {
        case app
        case configuration
        case navigation
        case networking
        case authentication
        case persistence
    }

    private let logger: Logger

    public init(subsystem: String = "com.kushank.devhub", category: Category) {
        logger = Logger(subsystem: subsystem, category: category.rawValue)
    }

    public func debug(_ message: String) {
        logger.debug("\(message, privacy: .public)")
    }

    public func info(_ message: String) {
        logger.info("\(message, privacy: .public)")
    }

    public func warning(_ message: String) {
        logger.warning("\(message, privacy: .public)")
    }

    public func error(_ message: String) {
        logger.error("\(message, privacy: .public)")
    }
}
