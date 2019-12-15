import Foundation

public class Leetcode {
    // TODO: Fix internal
    internal let requestBuilder = LeetcodeRequestBuilder()
    
    public var urlSession: LeetcodeURLSession
    
    public init() {
        self.urlSession = LeetcodeURLSessionImpl()
    }
    
    public func getUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        let query = """
        {
            user {
                username
                isCurrentUserPremium
            }
        }
        """
        graphqlRequest(
            using: .init(query: query),
            method: .post,
            origin: "/",
            referer: "/",
            responseType: UserInfoData.self,
            completion: { result in
                switch result {
                case .success(let info):
                    completion(.success(info.data.user))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .graphqlError(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
        
    public func getFavorites(completion: @escaping (GetFavouritesResult) -> Void) {
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
                        responseBody: error.data,
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
    
    
    public func addQuestion(
        withID questionID: Int,
        toFavoriteListWithIDHash idHash: String,
        completion: @escaping (AddQuestionToFavoriteResult) -> Void
    ) {
        let query = """
        mutation addQuestionToFavorite($favoriteIdHash: String!, $questionId: String!)
        {
            addQuestionToFavorite(favoriteIdHash: $favoriteIdHash, questionId: $questionId)
            {
                ok
                error
            }
        }
        """
        let params = LeetcodeGraphqlRequestParams(
            query: query,
            variables: [
                "favoriteIdHash": "\(idHash)",
                "questionId": "\(questionID)"
            ],
            operationName: "addQuestionToFavorite"
        )
        
        // TODO: Fix referer path
        graphqlRequest(
            using: params,
            method: .post,
            origin: "/",
            referer: "/",
            responseType: AddQuestionToFavoriteDataWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    let info = wrapper.data.addQuestionToFavorite
                    if info.ok {
                        completion(.success)
                    } else if let error = info.error {
                        let error = SomeLeetcodeError(localizedDescription: error)
                        completion(.someFailure(error))
                    }
                case .decodingFailure(let error):
                    completion(.someFailure(error))
                case .graphqlError(let error):
                    completion(.someFailure(error))
                case .networkFailure(let error):
                    completion(.networkFailure(error))
                }
            }
        )
    }
    
    public func addQuestion(
        withID questionID: Int,
        toNewFavoriteList list: NewFavoriteList,
        completion: @escaping (AddQuestionToNewFavoriteResult) -> Void
    ) {
        let query = """
        mutation addQuestionToNewFavorite($name: String!, $isPublicFavorite: Boolean!, $questionId: String!)
        {
            addQuestionToNewFavorite(name: $name, isPublicFavorite: $isPublicFavorite, questionId: $questionId)
                {
                    ok
                    error
                    favoriteIdHash
                }
        }
        """
        let params = LeetcodeGraphqlRequestParams(
            query: query,
            variables: [
                "questionId": "\(questionID)",
                "isPublicFavorite": list.isPublic ? "true" : "false",
                "name": list.name
            ],
            operationName: "addQuestionToNewFavorite"
        )
        graphqlRequest(
            using: params,
            method: .post,
            origin: "/",
            referer: "/",
            responseType: AddQuestionToNewFavoriteDataWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    let info = wrapper.data.addQuestionToNewFavorite
                    if info.ok, let id = info.favoriteIdHash {
                        completion(.success(favoriteIdHash: id))
                    } else if let error = info.error {
                        let error = SomeLeetcodeError(localizedDescription: error)
                        completion(.someFailure(error))
                    }
                case .decodingFailure(let error):
                    completion(.someFailure(error))
                case .graphqlError(let error):
                    completion(.someFailure(error))
                case .networkFailure(let error):
                    completion(.networkFailure(error))
                }
            }
        )
    }
    
    public func getAllProblems(completion: @escaping (Result<GetProblemsResponse, Error>) -> Void) {
        getProblems(forCategory: "all", completion: completion)
    }
    
    public func getProblems(
        forCategory category: String,
        completion: @escaping (Result<GetProblemsResponse, Error>) -> Void
    ) {
        var request = requestBuilder.build(
            path: "/api/problems/\(category)/",
            method: .get,
            origin: "/api/problems/\(category)/",
            referer: "/api/problems/\(category)/"
        )
        request.setContentType(.applicationJSON)
        
        urlSession.request(request, responseType: GetProblemsResponse.self) { result in
            switch result {
            case .success(let value):
                completion(.success(value))
            case .decodingFailure(let error):
                completion(.failure(error))
            case .networkFailure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func details(
        forProblemWithSlug slug: String,
        completion: @escaping (Result<QuestionDetails, Error>) -> Void
    ) {
        let query = """
        query getQuestionDetail($titleSlug: String!) {
            question(titleSlug: $titleSlug) {
                content
                stats
                likes
                dislikes
                codeDefinition
                sampleTestCase
                enableRunCode
                metaData
                translatedContent
            }
        }
        """
        graphqlRequest(
            using: .init(
                query: query,
                variables: ["titleSlug": slug],
                operationName: "getQuestionDetail"
            ),
            method: .post,
            origin: "/",
            referer: "/",
            responseType: QuestionDetailsWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    completion(.success(wrapper.data.question))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .graphqlError(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    public func interpretSolution(
        _ solution: Solution,
        completion: @escaping (Result<InterpretSolutionResponse, InterpreSolutionError>) -> Void
    ) {
       let request = requestBuilder.build(
        path: "/problems/\(solution.problemID.slug)/interpret_solution/",
           method: .post,
           origin: "/",
           referer: "/problems/\(solution.problemID.slug)/description/"
       ) { request in
            try? request.setJSONBody(solution)
        }
        
        urlSession.request(request, completion: { result in
                switch result {
                case let .success(data, response):
                    if let url = response.url, url.path.contains("subscribe") {
                        completion(.failure(.paidResourceAccess))
                    } else {
                        let decoder = JSONDecoder()
                        do {
                            let value = try decoder.decode(InterpretSolutionResponse.self, from: data)
                            completion(.success(value))
                        } catch let error {
                            let decodingError = HTTPURLResponseDecodingError(
                                data: data,
                                response: response,
                                decodingError: error
                            )
                            completion(.failure(.decodingFailure(decodingError)))
                        }
                    }
                case .failure(let error):
                    completion(.failure(.networkFailure(error)))
                }
            }
        )
    }
    
    public func checkIntepretationWithID(
        _ id: String,
        forProblemWithSlug slug: String,
        completion: @escaping (Result<VerificationInfo, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/submissions/detail/\(id)/check",
            method: .get,
            origin: "/",
            referer: "/problems/\(slug)/description"
        )
        urlSession.request(request, completion: { [weak self] result in
                switch result {
                case let .success(data, response):
                    let decoder = JSONDecoder()
                    do {
                        let wrapper = try decoder.decode(
                            CheckIntepretationStateWrapper.self,
                            from: data
                        )
                        if wrapper.state == .success {
                            do {
                                let decoder = JSONDecoder()
                                let info = try decoder.decode(
                                    VerificationInfo.self,
                                    from: data
                                )
                                completion(.success(info))
                            } catch let error {
                                let decodingError = HTTPURLResponseDecodingError(
                                    data: data,
                                    response: response,
                                    decodingError: error
                                )
                                completion(.failure(decodingError))
                            }
                        } else {
                            self?.checkIntepretationWithID(
                                id,
                                forProblemWithSlug: slug,
                                completion: completion
                            )
                        }
                    } catch let error {
                        let decodingError = HTTPURLResponseDecodingError(
                            data: data,
                            response: response,
                            decodingError: error
                        )
                        completion(.failure(decodingError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    public func testSolution(
        _ solution: Solution,
        completion: @escaping (Result<VerificationInfo, Error>) -> Void
    ) {
        interpretSolution(solution, completion: { [weak self] result  in
            switch result {
            case .success(let response):
                self?.checkIntepretationWithID(
                    response.interpret_id,
                    forProblemWithSlug: solution.problemID.slug,
                    completion: completion
                )
            case .failure(let error):
                completion(.failure(error))
            }
        })
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
