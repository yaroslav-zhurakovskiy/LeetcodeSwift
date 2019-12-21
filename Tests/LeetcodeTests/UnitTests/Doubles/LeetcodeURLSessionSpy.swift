import Foundation
import Leetcode
import XCTest

class LeetcodeURLSessionSpy: LeetcodeURLSession {
    private(set) var requests: [URLRequest] = []
    private var result: LeetcodeURLResponseResult?
    
    
    func setResult(_ result: LeetcodeURLResponseResult) {
        self.result = result
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
    
    func setSuccessResult(body: String, statusCode: Int) throws {
        setSuccessResult(body: body.data(using: .utf8) ?? Data(), statusCode: statusCode)
    }
    
    func setSuccessResult(bodyStub: ResponseBodyStub, statusCode: Int) throws {
        try setSuccessResult(body: bodyStub.value, statusCode: statusCode)
    }
    
    func request(
        _ request: URLRequest,
        completion: @escaping (LeetcodeURLResponseResult) -> Void
    ) {
        requests.append(request)
        if let result = result {
            completion(result)
        }
    }
}

class LeetcodeURLSessionMock: LeetcodeURLSessionSpy {
    func assertOneRequest(file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(requests.count, 1, "One request", file: file, line: line)
    }
}
