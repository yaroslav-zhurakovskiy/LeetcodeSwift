import XCTest
@testable import Leetcode
import Foundation

class GetDetailsForProblemTests: LeetcodeTestCase {
    private let problemSlug = "slug"
    
    func testSmoke() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .getQuestiondetails, statusCode: .any)
        
        var result: Result<QuestionDetails, Error>!
        leetcode.getDetails(forProblemWithSlug: problemSlug) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
        let value = retreiveValue(fromResult: result)
        XCTAssertEqual(value.content, "content")
        XCTAssertEqual(value.stats, "stats")
        XCTAssertEqual(value.likes, 12825)
        XCTAssertEqual(value.dislikes, 457)
        XCTAssertEqual(value.codeDefinition, "codeDefinition")
        XCTAssertEqual(value.sampleTestCase, "sampleTestCase")
        XCTAssertEqual(value.enableRunCode, true)
    }
    
    func testFailure() {
        urlSessionSpy.setFailureResult(error: TestError.shared)
        
        var result: Result<QuestionDetails, Error>!
        leetcode.getDetails(forProblemWithSlug: problemSlug) { result = $0 }
        
        assertCorrectRequest()
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === TestError.shared)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest(line: line)
        
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/graphql", line: line)
        assertMethod(of: request, isEqualTo: "POST", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertBody(
            of: request,
            isEqualToJSON: [
                "query": """
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
                """,
                "variables": ["titleSlug": problemSlug],
                "operationName": "getQuestionDetail"
            ]
        )
    }
}
