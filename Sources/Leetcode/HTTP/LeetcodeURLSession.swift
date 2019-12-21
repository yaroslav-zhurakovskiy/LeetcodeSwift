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

public protocol LeetcodeJSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

public class LeetcodeJSONDecoderImpl: LeetcodeJSONDecoder {
    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}

public struct LeetcodeJSONDecoderHolder {
    private init() { }
    
    public static var current: LeetcodeJSONDecoder = LeetcodeJSONDecoderImpl()
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
                do {
                    let value = try LeetcodeJSONDecoderHolder.current.decode(responseType, from: data)
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
    public let session: URLSession
    
    public init(cookieStorage: HTTPCookieStorage) {
// TODO: Fix
//        let configuration = URLSessionConfiguration()
//        configuration.httpCookieStorage = cookieStorage
//        configuration.httpShouldSetCookies = true
        session = .shared
    }
    
    public func request(
        _ request: URLRequest,
        completion: @escaping (LeetcodeURLResponseResult) -> Void
    ) {
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data, let response = response as? HTTPURLResponse {
               completion(.success((data: data, response: response)))
            } else if let error = error {
               completion(.failure(error))
            }
        }
        task.resume()
    }
}
