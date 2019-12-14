import Foundation

public typealias LeetcodeURLResponse = (data: Data, response: HTTPURLResponse)
public typealias LeetcodeURLResponseResult = Result<LeetcodeURLResponse, Error>

public protocol LeetcodeURLSession: class {
    func request(
        _ request: URLRequest,
        completion: @escaping (LeetcodeURLResponseResult) -> Void
    )
}

public enum LeetcodeURLDecodedResponseResult<Value: Decodable> {
    case success(Value)
    case decodingFailure(HTTPURLResponseDecodingError)
    case networkFailure(Error)
}

public extension LeetcodeURLSession {
    func request<Response: Decodable>(
        _ request: URLRequest,
        responseType: Response.Type,
        completion: @escaping (LeetcodeURLDecodedResponseResult<Response>) -> Void
    ) {
        self.request(request) { result in
            switch result {
            case let .success(data, response):
                let decoder = JSONDecoder()
                do {
                    let value = try decoder.decode(responseType, from: data)
                    completion(.success(value))
                } catch let error {
                    let decodingError = HTTPURLResponseDecodingError(
                        data: data,
                        response: response,
                        decodingError: error
                    )
                    completion(.decodingFailure(decodingError))
                }
            case .failure(let error):
                completion(.networkFailure(error))
            }
        }
    }
}

public class LeetcodeURLSessionImpl: LeetcodeURLSession {
    private let session: URLSession
    
    public init() {
        session = .shared
    }
    
    public func request(
        _ request: URLRequest,
        completion: @escaping (LeetcodeURLResponseResult) -> Void
    ) {
        let task = session.dataTask(with: request) {
        (data: Data?, response: URLResponse?, error: Error?) in

        if let data = data, let response = response as? HTTPURLResponse {
           completion(.success((data: data, response: response)))
        } else if let error = error {
           completion(.failure(error))
        }

        }
        task.resume()
    }
}
