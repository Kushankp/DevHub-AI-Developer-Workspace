import Foundation

/// Reads strongly typed values from an app configuration dictionary.
public struct ConfigurationReader: Sendable {
    private let values: [String: String]

    public init(values: [String: String]) {
        self.values = values
    }

    public func string(for key: String) -> String? {
        guard let value = values[key]?.trimmingCharacters(in: .whitespacesAndNewlines),
              !value.isEmpty else {
            return nil
        }

        return value
    }

    public func url(for key: String) throws -> URL? {
        guard let value = string(for: key) else {
            return nil
        }

        guard let url = URL(string: value) else {
            throw ConfigurationReaderError.invalidURL(key: key, value: value)
        }

        return url
    }
}

public enum ConfigurationReaderError: LocalizedError, Equatable, Sendable {
    case invalidURL(key: String, value: String)

    public var errorDescription: String? {
        switch self {
        case let .invalidURL(key, value):
            "Configuration value \(key) is not a valid URL: \(value)"
        }
    }
}
