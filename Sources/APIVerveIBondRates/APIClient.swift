@_exported import APIVerveCore
import Foundation

/// Main API client for I-Bond Rates
public class IBondRatesAPIClient {
    private let transport: APIVerveTransport

    /// Initialize the API client
    /// - Parameter apiKey: Your APIVerve API key from https://apiverve.com
    public init(apiKey: String) {
        self.transport = APIVerveTransport(apiKey: apiKey, apiID: "savingsbonds", authMode: "cocoapods-package")
    }

    /// Execute the API request
    /// - Parameters:
    ///   - parameters: Query parameters or request body
    ///   - completion: Completion handler with Result type
    public func execute(parameters: [String: Any]? = nil, completion: @escaping (Result<APIResponse, IBondRatesAPIError>) -> Void) {
        transport.get(parameters: parameters, completion: completion)
    }
}

// MARK: - Async/Await Support (iOS 13+)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension IBondRatesAPIClient {
    /// Execute the API request using async/await
    /// - Parameter parameters: Query parameters or request body
    /// - Returns: APIResponse on success
    /// - Throws: IBondRatesAPIError on failure
    public func execute(parameters: [String: Any]? = nil) async throws -> APIResponse {
        try await withCheckedThrowingContinuation { continuation in
            execute(parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }

}

