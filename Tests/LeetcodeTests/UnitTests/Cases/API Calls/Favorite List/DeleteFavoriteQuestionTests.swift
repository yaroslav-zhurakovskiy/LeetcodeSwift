//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
import Leetcode

class DeleteFavoriteQuestionTests: LeetcodeTestCase {
    private let id = FavoriteQuestionID(favoriteIDHash: "id", questionID: 0)
    
    func testSuccss204() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .empty, statusCode: 204)
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteQuestion(byID: id) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
    }
    
    func testSuccssNon204() throws {
        let body = Data.test
        let response = HTTPURLResponse(statusCode: 0)
        urlSessionSpy.setResult(.success((data: body, response: response)))
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteQuestion(byID: id) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: LeetcodeHTTPError.self)
        XCTAssertEqual(error.responseBody, body)
        XCTAssertTrue(response === error.response)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteQuestion(byID: id) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest(line: line)
        let request = urlSessionSpy.requests[0]
        
        assertURL(
            of: request,
            isEqualToLeetcodePath: "/list/api/questions/\(id.favoriteIDHash)/\(id.questionID)",
            line: line
        )
        assertMethod(of: request, isEqualTo: "DELETE", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/list", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
    }
}
