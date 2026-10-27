import Foundation

/// Request plumbing shared by every APIVerve client
public final class APIVerveTransport {
    private let apiKey: String
    private let baseURL: String
    private let authMode: String
    private let session: URLSession

    /// - Parameters:
    ///   - apiKey: Your APIVerve API key from https://apiverve.com
    ///   - apiID: The API id in the endpoint path, e.g. "emailvalidator"
    ///   - authMode: Sent as the auth-mode header to identify the SDK
    public init(apiKey: String, apiID: String, authMode: String) {
        guard !apiKey.isEmpty else {
            fatalError("API key must be provided. Get your API key at: https://apiverve.com")
        }

        // Validate API key format (GUID, prefixed keys like apv_xxx, or alphanumeric)
        let apiKeyPattern = "^[a-zA-Z0-9_-]+$"
        guard apiKey.range(of: apiKeyPattern, options: .regularExpression) != nil else {
            fatalError("Invalid API key format. API key must be alphanumeric and may contain hyphens and underscores")
        }

        self.apiKey = apiKey
        self.baseURL = "https://api.apiverve.com/v1/\(apiID)"
        self.authMode = authMode

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 300
        self.session = URLSession(configuration: config)
    }

    /// Send parameters as the query string
    public func get(parameters: [String: Any]?, completion: @escaping (Result<APIResponse, APIVerveError>) -> Void) {
        var urlComponents = URLComponents(string: baseURL)

        if let parameters = parameters, !parameters.isEmpty {
            urlComponents?.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }

        guard let url = urlComponents?.url else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        perform(request, completion: completion)
    }

    /// Send parameters as a JSON body
    public func post(parameters: [String: Any]?, completion: @escaping (Result<APIResponse, APIVerveError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                completion(.failure(.invalidParameters))
                return
            }
        }

        perform(request, completion: completion)
    }

    /// Send one file as multipart/form-data
    public func upload(fileData: Data, fileName: String, fieldName: String, mimeType: String, completion: @escaping (Result<APIResponse, APIVerveError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }

        let boundary = "Boundary-\(UUID().uuidString)"

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        body.append(fileData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body

        perform(request, completion: completion)
    }

    private func perform(_ request: URLRequest, completion: @escaping (Result<APIResponse, APIVerveError>) -> Void) {
        var request = request
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue(authMode, forHTTPHeaderField: "auth-mode")

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            if httpResponse.statusCode != 200 {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    completion(.failure(.apiError(statusCode: httpResponse.statusCode, message: errorResponse.error ?? "Unknown error")))
                } catch {
                    completion(.failure(.httpError(statusCode: httpResponse.statusCode)))
                }
                return
            }

            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(apiResponse))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }

        task.resume()
    }
}
