public struct SubmitSolutionResponse: Decodable {
    let submission_id: Int
}

struct SubmissionDumpWrapper: Decodable {
    let submissions_dump: [SubmissionDumpRecord]
}

struct QuestionDetailsWrapper: Decodable {
    struct Data: Decodable {
        let question: QuestionDetails
    }
    
    let data: Data
}

public struct ProblemID {
    public let questionID: Int
    public let slug: String
    
    public init(questionID: Int, slug: String) {
        self.questionID = questionID
        self.slug = slug
    }
}

public extension Leetcode {
    func submitCode(
        _ code: Code,
        forProblemWithID problem: ProblemID,
        completion: @escaping (Result<SubmitSolutionResponse, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/problems/\(problem.slug)/submit/",
            method: .post,
            origin: "/",
            referer: "/problems/\(problem.slug)/submissions/"
        ) { request in
            try? request.setJSONBody([
                "question_id": "\(problem.questionID)",
                "lang": code.lang.value,
                "typed_code": code.text
            ])
        }
        urlSession.request(
            request,
            responseType: SubmitSolutionResponse.self,
            completion: { result in
                switch result {
                case .success(let value):
                    completion(.success(value))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    
    
    func listSubmissions(
        forProblemWithSlug slug: String,
        completion: @escaping (Result<[SubmissionDumpRecord], Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/api/submissions/\(slug)",
            method: .get,
            origin: "/",
            referer: "/problems/\(slug)/submissions/"
        )
        
        urlSession.request(
            request,
            responseType: SubmissionDumpWrapper.self,
            completion: { result in
                switch result {
                case .success(let value):
                    completion(.success(value.submissions_dump))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
}
