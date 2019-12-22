import XCTest
@testable import Leetcode
import Foundation

class CheckInterpretationTests: LeetcodeTestCase {
    let interpretationID = "interpretation"
    let problemSlug = "slug"
        
    func testStatusSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .checkInterpretSolutionSuccess, statusCode: 200)
        
        var result: Result<IntepretSolutionResponse, Error>!
        leetcode.checkInterpretation(
            withID: interpretationID,
            forProblemWithSlug: problemSlug,
            completion: { result = $0 }
        )
        
        assertNumberOfRequests(equalsTo: 1)
        assertCorrectRequest(at: 0)
        XCTAssertNotNil(result)
        assertSuccess(result)
        assertCorerctResponse(retreiveValue(fromResult: result))
    }
    
    func testStatusStarted() throws {
        urlSessionSpy.setSuccessResultSequence([
            (body: .checkInterpretSolutionStarted, statusCode: 200),
            (body: .checkInterpretSolutionSuccess, statusCode: 200)
        ])
        
        var result: Result<IntepretSolutionResponse, Error>!
        leetcode.checkInterpretation(
            withID: interpretationID,
            forProblemWithSlug: problemSlug,
            completion: { result = $0 }
        )
        
        assertNumberOfRequests(equalsTo: 2)
        assertCorrectRequest(at: 0)
        assertCorrectRequest(at: 1)
        XCTAssertNotNil(result)
        assertSuccess(result)
        assertCorerctResponse(retreiveValue(fromResult: result))
    }
    
    func testStatusPending() {
        urlSessionSpy.setSuccessResultSequence([
            (body: .checkInterpretSolutionPending, statusCode: 200),
            (body: .checkInterpretSolutionSuccess, statusCode: 200)
        ])
        
        var result: Result<IntepretSolutionResponse, Error>!
        leetcode.checkInterpretation(
            withID: interpretationID,
            forProblemWithSlug: problemSlug,
            completion: { result = $0 }
        )
        
        assertNumberOfRequests(equalsTo: 2)
        assertCorrectRequest(at: 0)
        assertCorrectRequest(at: 1)
        XCTAssertNotNil(result)
        assertSuccess(result)
        assertCorerctResponse(retreiveValue(fromResult: result))
    }
    
    func testStatusMissing() {
        urlSessionSpy.setSuccessResultSequence([
            (body: .checkInterpretSolutionStatusMissing, statusCode: 200),
            (body: .checkInterpretSolutionSuccess, statusCode: 200)
        ])
        
        var result: Result<IntepretSolutionResponse, Error>!
        leetcode.checkInterpretation(
            withID: interpretationID,
            forProblemWithSlug: problemSlug,
            completion: { result = $0 }
        )
        
        assertNumberOfRequests(equalsTo: 2)
        assertCorrectRequest(at: 0)
        assertCorrectRequest(at: 1)
        XCTAssertNotNil(result)
        assertSuccess(result)
        assertCorerctResponse(retreiveValue(fromResult: result))
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<IntepretSolutionResponse, Error>!
        leetcode.checkInterpretation(
            withID: interpretationID,
            forProblemWithSlug: problemSlug,
            completion: { result = $0 }
        )
        
        assertNumberOfRequests(equalsTo: 1)
        assertCorrectRequest(at: 0)
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertNumberOfRequests(equalsTo number: Int, line: UInt = #line) {
        urlSessionSpy.assertNumberOfRequests(equalsTo: number, line: line)
    }

    private func assertCorrectRequest(at index: Int, line: UInt = #line) {
        let request = urlSessionSpy.requests[index]
        assertURL(
            of: request,
            isEqualToLeetcodePath: "/submissions/detail/\(interpretationID)/check",
            line: line
        )
        assertMethod(of: request, isEqualTo: "GET", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/problems/\(problemSlug)/description", line: line)
    }
    
    private func assertCorerctResponse(_ value: IntepretSolutionResponse, line: UInt = #line) {
        XCTAssertEqual(value.compile_error, "compile_error", "compile_error", line: line)
        XCTAssertEqual(value.elapsed_time, 1, "elapsed_time", line: line)
        XCTAssertEqual(value.full_compile_error, "full_compile_error", line: line)
        XCTAssertEqual(value.lang, "lang", "lang", line: line)
        XCTAssertEqual(value.memory, 1, "memory", line: line)
        XCTAssertEqual(value.memory_percentile, nil, "memory_percentile", line: line)
        XCTAssertEqual(value.pretty_lang, "pretty_lang", "pretty_lang", line: line)
        XCTAssertEqual(value.run_success, true, "run_success", line: line)
        XCTAssertEqual(value.runtime_percentile, nil, "runtime_percentile", line: line)
        XCTAssertEqual(value.state, "SUCCESS", "state", line: line)
        XCTAssertEqual(value.status_code, 1, "status_code", line: line)
        XCTAssertEqual(value.status_memory, "status_memory", "status_memory", line: line)
        XCTAssertEqual(value.status_msg, "status_msg", "status_msg", line: line)
        XCTAssertEqual(value.status_runtime, "status_runtime", "status_runtime", line: line)
        XCTAssertEqual(value.submission_id, "submission_id", "submission_id", line: line)
        XCTAssertEqual(value.task_finish_time, 1, "task_finish_time", line: line)
        XCTAssertEqual(value.total_correct, nil, "total_correct", line: line)
        XCTAssertEqual(value.total_testcases, nil, "total_testcases", line: line)
        XCTAssertEqual(value.code_answer, ["code_answer_1"], "code_answer", line: line)
    }
}
