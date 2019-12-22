import XCTest
@testable import Leetcode
import Foundation

class InterpretSolutionTests: LeetcodeTestCase {
    private let solution = Solution(
        forProblemWithID: ProblemID(questionID: 0, slug: "slug"),
        code: Code(text: "puts 0", lang: .ruby),
        input: .empty,
        judge: .large
    )
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .interpretSolutionSuccess, statusCode: 200)
        
        var result: Result<InterpretSolutionResponse, InterpretSolutionError>!
        leetcode.interpretSolution(solution) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
        let value = retreiveValue(fromResult: result)
        XCTAssertEqual(value.interpret_id, "interpret_id")
        XCTAssertEqual(value.test_case, "test_case")
    }
    
    func testUnauthorized() {
        let testData = Data.test
        let response = HTTPURLResponse(
            url: URL(leetcodePath: "subscribe"),
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!
        urlSessionSpy.setResult(.success((data: testData, response: response)))
        
        var result: Result<InterpretSolutionResponse, InterpretSolutionError>!
        leetcode.interpretSolution(solution) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: InterpretSolutionError.self)
        assertPaidResourceAccess(error)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<InterpretSolutionResponse, InterpretSolutionError>!
        leetcode.interpretSolution(solution) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        let error = retreiveError(fromResult: result, as: InterpretSolutionError.self)
        
        assert(error, isTestError: testError)
    }
    
    func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest()
        
        let request = urlSessionSpy.requests[0]
        assertURL(
            of: request,
            isEqualToLeetcodePath: "/problems/\(solution.problemID.slug)/interpret_solution/",
            line: line
        )
        assertMethod(of: request, isEqualTo: "POST", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(
            of: request,
            isEqualToLeetcodePath: "/problems/\(solution.problemID.slug)/description/",
            line: line
        )
        assertBody(
            of: request,
            isEqualToJSON: [
                "question_id": solution.problemID.questionID,
                "judge_type": solution.judge.value,
                "data_input": solution.input.rawValue,
                "lang": solution.code.lang,
                "typed_code": solution.code.text
            ],
            line: line
        )
    }
}

func assertPaidResourceAccess(
    _ error: InterpretSolutionError,
    file: StaticString = #file,
    line: UInt = #line
) {
    if case .paidResourceAccess = error {
        // Do nothing
    } else {
        XCTFail("\(error) is not \(InterpretSolutionError.paidResourceAccess)", file: file, line: line)
    }
}

func assert(
    _ error: InterpretSolutionError,
    isTestError testError: TestError,
    file: StaticString = #file,
    line: UInt = #line
) {
    if case .generic(let actualError) = error {
        XCTAssertTrue(
            (actualError as! TestError) === testError,
            "\(actualError) is not identical to \(testError)",
            file: file,
            line: line
        )
    } else {
        XCTFail(
            "\(error) is not \(InterpretSolutionError.paidResourceAccess)",
            file: file,
            line: line
        )
    }
}
