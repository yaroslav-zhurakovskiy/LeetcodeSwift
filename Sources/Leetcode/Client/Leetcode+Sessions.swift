//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct SessionNameAlreadyExists: LeetcodeError {
    public let name: String
    
    public var localizedDescription: String {
        return "\"name\" already exists"
    }
}

public extension Leetcode {
    func createSession(
        withName name: String,
        completion: @escaping (Result<CreateSessionResponse, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/session",
            method: .put,
            origin: "/",
            referer: "/session"
        ) { request in
            try? request.setJSONBody([
                "func": "create",
                "name": name
            ])
        }
        urlSession.request(request, completion: { result in
            switch result {
            case let .success(data, response):
                if response.statusCode == 400 {
                    completion(.failure(SessionNameAlreadyExists(name: name)))
                } else {
                    let decoder = LeetcodeJSONDecoderImpl()
                    do {
                        let value = try decoder.decode(CreateSessionResponse.self, from: data)
                        completion(.success(value))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func renameSession(
        withID id: Int,
        to name: String,
        completion: @escaping (Result<CreateSessionResponse, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/session",
            method: .put,
            origin: "/",
            referer: "/session"
        ) { request in
            try? request.setJSONBody([
                "func": "rename",
                "target": id,
                "name": name
            ])
        }
        urlSession.request(
           request,
           responseType: CreateSessionResponse.self,
           completion: { result in
               switch result {
               case .success(let response):
                   completion(.success(response))
               case .decodingFailure(let error):
                   completion(.failure(error))
               case .networkFailure(let error):
                   completion(.failure(error))
               }
           }
        )
    }
    
    func deleteSession(byID id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = requestBuilder.build(
            path: "/session",
            method: .delete,
            origin: "/",
            referer: "/session"
        ) { request in
            try? request.setJSONBody(["target": id])
        }
        urlSession.request(request, completion: { result in
            switch result {
            case let .success(data, response):
                if response.statusCode == 200 {
                    completion(.success(()))
                } else {
                    let error = LeetcodeHTTPError(responseBody: data, response: response)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
