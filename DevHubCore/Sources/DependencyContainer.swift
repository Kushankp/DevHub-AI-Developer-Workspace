import Foundation

public final class DependencyContainer: @unchecked Sendable {
    private var factories: [ObjectIdentifier: @Sendable (DependencyContainer) -> Any] = [:]
    private let lock = NSLock()

    public init() {}

    public func register<Service>(
        _ serviceType: Service.Type = Service.self,
        factory: @escaping @Sendable (DependencyContainer) -> Service
    ) {
        let key = ObjectIdentifier(serviceType)
        lock.withLock {
            factories[key] = factory
        }
    }

    public func resolve<Service>(_ serviceType: Service.Type = Service.self) -> Service {
        let key = ObjectIdentifier(serviceType)
        let factory = lock.withLock {
            factories[key]
        }

        guard let factory, let service = factory(self) as? Service else {
            preconditionFailure("Missing dependency registration for \(serviceType)")
        }

        return service
    }
}
