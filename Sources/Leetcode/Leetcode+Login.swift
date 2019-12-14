//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct LoginGredenetials {
    public let login: String
    public let password: String
    
    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

public extension Leetcode {
    func login(
        using credentials: LoginGredenetials,
        completion: @escaping (LeetcodeResult<Void, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/accounts/login/",
            method: .post,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/accounts/login/")
        ) { request in
            request.setFormData([
                "login": credentials.login,
                "password": credentials.password
            ])
            request.setValue(
                "Cookie",
                forHTTPHeaderField: "__cfduid=d7a00350357943f1f3b88475f591bb3901575997816; _ga=GA1.2.1812663345.1575997823; _gid=GA1.2.1498272129.1576317709; csrftoken=fiIBcq1DS9OFXRy6qyBRWvsANhqn1beEkdEJsU8AulVrNjJlFl8knIHJSYIJ1orF; _gat=1"
            )
        }
        urlSession.request(request) { result in
            switch result {
            case let .success(data, response):
                let text = String(data: data, encoding: .utf8)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
