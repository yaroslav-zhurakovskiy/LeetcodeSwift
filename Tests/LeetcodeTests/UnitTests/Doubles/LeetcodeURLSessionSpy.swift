//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import Leetcode
import XCTest

class LeetcodeURLSessionSpy: LeetcodeURLSession {
    private(set) var requests: [URLRequest] = []
    private(set) var results: [LeetcodeURLResponseResult] = []
    
    func setResult(_ result: LeetcodeURLResponseResult) {
        self.results = [result]
    }
    
    func setResultSequence<S>(_ sequence: S) where S: Sequence, S.Element == LeetcodeURLResponseResult {
        self.currentResultIndex = 0
        self.results = Array(sequence)
    }
    
    func setSuccessResultSequence(_ seq: [(body: ResponseBodyStub, statusCode: Int)]) {
        let resultSequence = seq.map { (params) -> LeetcodeURLResponseResult in
            return .success(
                (
                    data: params.body.value.data(using: .utf8) ?? Data(),
                    response: HTTPURLResponse(
                        url: URL(fileURLWithPath: #file),
                        statusCode: params.statusCode,
                        httpVersion: nil,
                        headerFields: nil
                    )!
                )
            )
        }
        setResultSequence(resultSequence)
    }
    
    func setSuccessResult(body: Data, statusCode: Int) {
        let response = HTTPURLResponse(
            url: URL(fileURLWithPath: #file),
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
        setResult(.success((body, response)))
    }
    
    func setFailureResult(error: Error) {
        setResult(.failure(error))
    }
    
    func setSuccessResult(bodyStub: ResponseBodyStub, statusCode: Int) throws {
        try setSuccessResult(body: bodyStub.value, statusCode: statusCode)
    }
    
    private func setSuccessResult(body: String, statusCode: Int) throws {
        setSuccessResult(body: body.data(using: .utf8) ?? Data(), statusCode: statusCode)
    }
    
    func request(
        _ request: URLRequest,
        completion: @escaping (LeetcodeURLResponseResult) -> Void
    ) {
        requests.append(request)
        if let result = nextResult {
            completion(result)
        }
    }
    
    private var currentResultIndex: Int = 0
    private var nextResult: LeetcodeURLResponseResult? {
        guard currentResultIndex < results.count else {
            return nil
        }
        
        let next =  results[currentResultIndex]
        currentResultIndex += 1
        return next
    }
}

class LeetcodeURLSessionMock: LeetcodeURLSessionSpy {
    func assertOneRequest(file: StaticString = #file, line: UInt = #line) {
        assertNumberOfRequests(equalsTo: 1, file: file, line: line)
    }
    
    func assertNumberOfRequests(equalsTo number: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(requests.count, number, "Number of requests", file: file, line: line)
    }
}
