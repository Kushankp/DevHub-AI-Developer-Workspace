import XCTest
@testable import DevHubCore

private protocol GreetingService {
    func greeting() -> String
}

private struct ProductionGreetingService: GreetingService {
    func greeting() -> String {
        "Hello, DevHub"
    }
}

final class DependencyContainerTests: XCTestCase {
    func resolvesRegisteredProtocolServices() {
        let container = DependencyContainer()
        container.register(GreetingService.self) { _ in
            ProductionGreetingService()
        }

        let service: any GreetingService = container.resolve(GreetingService.self)

        XCTAssertEqual(service.greeting(), "Hello, DevHub")
    }

    func replacesExistingRegistrationForServiceType() {
        let container = DependencyContainer()
        container.register(GreetingService.self) { _ in
            ProductionGreetingService()
        }
        container.register(GreetingService.self) { _ in
            ReplacementGreetingService()
        }

        let service: any GreetingService = container.resolve(GreetingService.self)

        XCTAssertEqual(service.greeting(), "Replacement")
    }
}

private struct ReplacementGreetingService: GreetingService {
    func greeting() -> String {
        "Replacement"
    }
}
