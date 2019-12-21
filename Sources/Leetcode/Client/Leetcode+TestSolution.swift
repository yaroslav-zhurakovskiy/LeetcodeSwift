import Foundation

extension Leetcode {
    public func interpretSolution(
        _ solution: Solution,
        completion: @escaping (Result<InterpretSolutionResponse, InterpretSolutionError>) -> Void
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
}
