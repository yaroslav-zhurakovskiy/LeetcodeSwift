//
//  File.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

struct SubmitSolutionResponseWrapper: Decodable {
    let submission_id: Int
}

public enum SubmitSolutionResult {
    case success(submissionID: Int)
    case failure(Error)
}

public enum ListSubmissionsResult {
    case success([SubmissionDumpRecord])
    case failure(Error)
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

public extension Leetcode {
    func submitSolution(
        forProblem sug: String,
        questionID: Int,
        code: Code,
        completion: @escaping (SubmitSolutionResult) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/problems/\(sug)/submit/",
            method: .post,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/problems/\(sug)/submissions/")
        ) { request in
            try? request.setJSONBody([
                "question_id": "\(questionID)",
                "lang": code.lang.value,
                "typed_code": code.text
            ])
        }
        urlSession.request(
            request,
            responseType: SubmitSolutionResponseWrapper.self,
            completion: { result in
                switch result {
                case .success(let value):
                    completion(.success(submissionID: value.submission_id))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    func listSubmissions(
        forProblem sug: String,
        completion: @escaping (ListSubmissionsResult) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/api/submissions/\(sug)",
            method: .get,
            origin: String(leetcodePath: "/"),
            referer: String(leetcodePath: "/problems/\(sug)/submissions/")
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
    
    func details(
        forProblem slug: String,
        completion: @escaping (LeetcodeResult<QuestionDetails, Error>) -> Void
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
            referer: String(leetcodePath: "/"),
            responseType: QuestionDetailsWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    completion(.success(wrapper.data.question))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
}
