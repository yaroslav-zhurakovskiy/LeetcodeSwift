extension Leetcode {
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
    
}
