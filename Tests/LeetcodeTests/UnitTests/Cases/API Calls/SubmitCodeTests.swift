import XCTest
@testable import Leetcode
import Foundation

class SubmitCodeTests: LeetcodeTestCase {
    let code = Code(text: "alert(0);", lang: .javascript)
    let problemID = ProblemID(questionID: 0, slug: "slug")
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .submitCodeSuccess, statusCode: .any)
        
        var result: Result<SubmitSolutionResponse, Error>!
        leetcode.submitCode(code, forProblemWithID: problemID) { result = $0 }
        
        XCTAssertNotNil(result)
        assertCorrectRequest()
        let value = retreiveValue(fromResult: result)
        
        XCTAssertEqual(value.submission_id, 1)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<SubmitSolutionResponse, Error>!
        leetcode.submitCode(code, forProblemWithID: problemID) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(testError === error)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest()
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/problems/\(problemID.slug)/submit/", line: line)
        assertMethod(of: request, isEqualTo: "POST", line: line)
        assertOrigin(
            of: request,
            isEqualToLeetcodePath: "/",
            line: line
        )
        assertReferer(
            of: request,
            isEqualToLeetcodePath: "/problems/\(problemID.slug)/submissions/",
            line: line
        )
        assertContentType(of: request, isEqualTo: .applicationJSON)
        assertBody(
            of: request,
            isEqualToJSON: [
                "question_id": problemID.questionID,
                "lang": code.lang.value,
                "typed_code": code.text
            ],
            line: line
        )
    }
}
