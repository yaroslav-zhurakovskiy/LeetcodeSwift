import XCTest
@testable import Leetcode
import Foundation

class AddQuestionToFavoriteListTests: LeetcodeTestCase {
    let questionID = 1
    let favoriteListIDHash = "ID_HASH"
    
    func testStatus() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .addQuestionToFavoriteListSuccess, statusCode: 200)
        
        var result: Result<Void, Error>!
        leetcode.addQuestion(
            withID: questionID,
            toFavoriteListWithIDHash: favoriteListIDHash,
            completion: { result = $0 }
        )
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Void, Error>!
        leetcode.addQuestion(
            withID: questionID,
            toFavoriteListWithIDHash: favoriteListIDHash,
            completion: { result = $0 }
        )
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest()
        
        let request = urlSessionSpy.requests[0]
        assertGraphqlRequest(
            request,
            withMethod: "POST",
            query: """
            mutation addQuestionToFavorite($favoriteIdHash: String!, $questionId: String!)
            {
                addQuestionToFavorite(favoriteIdHash: $favoriteIdHash, questionId: $questionId)
                {
                    ok
                    error
                }
            }
            """,
            variables: [
                "favoriteIdHash": "\(favoriteListIDHash)",
                "questionId": "\(questionID)"
            ],
            operationName: "addQuestionToFavorite",
            line: line
        )
    }
}
