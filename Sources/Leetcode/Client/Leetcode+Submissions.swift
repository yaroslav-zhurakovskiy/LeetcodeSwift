//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

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
