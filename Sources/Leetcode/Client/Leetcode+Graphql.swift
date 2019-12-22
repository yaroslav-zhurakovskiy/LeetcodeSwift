//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

public struct LeetcodeGraphqlRequestParams: Codable {
    public let operationName: String?
    public let variables: [String: String]
    public let query: String
    
    public init(
        query: String,
        variables: [String: String] = [:],
        operationName: String? = nil
    ) {
        self.query = query
        self.variables = variables
        self.operationName = operationName
    }
}

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
    case decodingFailure(LeetcoeJSONDecodingError)
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
                        dic["errors"] is [[String: Any]] {
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
                    completion(.decodingFailure(LeetcoeJSONDecodingError(
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
