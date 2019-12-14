//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public extension Leetcode {
    func createSession(
        name: String,
        completion: @escaping (LeetcodeResult<CreateSessionResponse, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/session",
            method: .put,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/session")
        ) { request in
            try? request.setJSONBody([
                "func": "create",
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
    
    func renameSessionWithID(
        id: Int,
        to name: String,
        completion: @escaping (LeetcodeResult<CreateSessionResponse, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/session",
            method: .put,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/session")
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
    
    func deleteSession(byID id: Int, completion: @escaping (LeetcodeResult<Void, Error>) -> Void) {
        let request = requestBuilder.build(
            path: "/session",
            method: .delete,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/session")
        ) { request in
            try? request.setJSONBody(["target": id,])
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
