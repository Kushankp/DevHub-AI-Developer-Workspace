import Foundation

protocol NetworkClient: Sendable {
    func send<Request: NetworkRequest>(_ request: Request) async throws -> Request.Response
}

protocol NetworkRequest: Sendable {
    associatedtype Response: Decodable & Sendable

    var urlRequest: URLRequest { get throws }
}
