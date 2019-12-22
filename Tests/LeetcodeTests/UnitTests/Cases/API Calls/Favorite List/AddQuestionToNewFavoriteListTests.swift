import XCTest
@testable import Leetcode
import Foundation

class AddQuestionToNewFavoriteListTests: LeetcodeTestCase {
    let questionID = 1
    let newFavoriteList = NewFavoriteList(name: "NAME", isPublic: true)
    
    func testStatus() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .addQuestionToNewFavoriteListSuccess, statusCode: 200)
        
        var result: Result<AddQuestionResponse, Error>!
        leetcode.addQuestion(
            withID: questionID,
            toNewFavoriteList: newFavoriteList,
            completion: { result = $0 }
        )
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
        let value = retreiveValue(fromResult: result)
        XCTAssertEqual(value.favoriteIdHash, "ID_HASH")
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<AddQuestionResponse, Error>!
        leetcode.addQuestion(
            withID: questionID,
            toNewFavoriteList: newFavoriteList,
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
            mutation addQuestionToNewFavorite($name: String!, $isPublicFavorite: Boolean!, $questionId: String!)
            {
                addQuestionToNewFavorite(name: $name, isPublicFavorite: $isPublicFavorite, questionId: $questionId)
                    {
                        ok
                        error
                        favoriteIdHash
                    }
            }
            """,
            variables: [
                "questionId": "\(questionID)",
                "isPublicFavorite": newFavoriteList.isPublic ? "true" : "false",
                "name": newFavoriteList.name
            ],
            operationName: "addQuestionToNewFavorite",
            line: line
        )
    }
}
