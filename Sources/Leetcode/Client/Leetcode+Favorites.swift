extension Leetcode {
    public func getFavorites(completion: @escaping (Result<Favorites, Error>) -> Void) {
        let request = requestBuilder.build(
            path: "/list/api/questions",
            method: .get,
            origin: "/",
            referer: "/list/api/questions"
        )
        urlSession.request(request, responseType: Favorites.self) { result in
            switch result {
            case let .success(value):
                completion(.success(value))
            case .decodingFailure(let error):
                if error.response.statusCode == 401 {
                    completion(.failure(LeetcodeUnauthorized(
                        responseBody: error.body,
                        response: error.response
                    )))
                } else {
                    completion(.failure(error))
                }
            case .networkFailure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func deleteFavoriteQuestion(
        byID id: FavoriteQuestionID,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/list/api/questions/\(id.favoriteIDHash)/\(id.questionID)",
            method: .delete,
            origin: "https://leetcode.com",
            referer: "https://leetcode.com/list/"
        ) { request in
            request.setContentType(.applicationJSON)
        }
        
        urlSession.request(request) { result in
            switch result {
            case let .success(data, response):
                if response.statusCode == 204 {
                    completion(.success(()))
                } else {
                    let error = LeetcodeHTTPError(
                        responseBody: data,
                        response: response
                    )
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func deleteFavoriteList(
        byHashID hasID: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/list/api/\(hasID)",
            method: .delete,
            origin: "/list/",
            referer: "/list/"
        )
        urlSession.request(request, completion: { result in
            switch result {
            case let .success(data, response):
                if response.statusCode == 204 {
                    completion(.success(()))
                } else {
                    let error = SomeLeetcodeError(
                        localizedDescription: String(
                            data: data,
                            encoding: .utf8
                        ) ?? ""
                    )
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
