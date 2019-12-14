import Foundation

public struct GraphqlErrorLocation: Decodable {
    public let line: Int
    public let column: Int
}

public struct GraphqlError: Decodable {
    public let message: String
    public let locations: [GraphqlErrorLocation]
}

public struct GraphqlInternalError: Error, Decodable {
    public let errors: [GraphqlError]
}

public enum GraphqlRequestResult<Value: Decodable> {
    case success(Value)
    case decodingFailure(HTTPURLResponseDecodingError)
    case graphqlError(GraphqlInternalError)
    case networkFailure(Error)
}

extension Leetcode {
    public func graphqlRequest<Response: Decodable>(
        using params: LeetcodeGraphqlRequestParams,
        method: LeetcodeHttpMethod,
        origin: String,
        referer: String,
        responseType: Response.Type,
        completion: @escaping (GraphqlRequestResult<Response>) -> Void
    ) {
        let request = requestBuilder.buildGraphql(
           from: params,
           method: method,
           origin: origin,
           referer: referer
        )

        urlSession.request(request) { result in
            switch result {
            case let .success(data, response):
                let decoder = JSONDecoder()
                do {
                    let obj = try JSONSerialization.jsonObject(with: data, options: [])
                    if
                        let dic = obj as? [String: Any],
                        let _ = dic["errors"] as? [[String: Any]] {
                        let error = try decoder.decode(
                            GraphqlInternalError.self,
                            from: data
                        )
                        completion(.graphqlError(error))
                    } else {
                        let value = try decoder.decode(responseType.self, from: data)
                        completion(.success(value))
                    }
                } catch let error {
                    completion(.decodingFailure(HTTPURLResponseDecodingError(
                        data: data,
                        response: response,
                        decodingError: error
                    )))
                }
            case .failure(let error):
                completion(.networkFailure(error))
            }
        }
    }
}
