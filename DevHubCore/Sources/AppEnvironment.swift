import Foundation

public struct AppEnvironment: Sendable {
    public let dependencies: DependencyContainer
    public let configuration: AppConfiguration

    public init(
        dependencies: DependencyContainer = DependencyContainer(),
        configuration: AppConfiguration
    ) {
        self.dependencies = dependencies
        self.configuration = configuration
    }
}
