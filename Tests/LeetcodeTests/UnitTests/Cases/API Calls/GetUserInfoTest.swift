//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
@testable import Leetcode

class GetUserInfoTest: LeetcodeTestCase {
    func testSucessGetUserInfo() throws {
        var result: Result<UserInfo, Error>!
        try urlSessionSpy.setSuccessResult(bodyStub: .getUserInfoSuccess, statusCode: 200)
        
        leetcode.getUserInfo { result = $0 }
        
        assertCorrectRequest()
        assertSuccess(result)
        let info = retreiveValue(fromResult: result)
        XCTAssertTrue(info.isCurrentUserPremium)
        XCTAssertEqual(info.username, "username")
    }
    
    func testTestFailureUserInfo() {
        var result: Result<UserInfo, Error>!
        urlSessionSpy.setFailureResult(error: TestError.shared)
        
        leetcode.getUserInfo { result = $0 }
        
        assertCorrectRequest()
        XCTAssertEqual(urlSessionSpy.requests.count, 1)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === TestError.shared)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        XCTAssertEqual(urlSessionSpy.requests.count, 1, "Number of requets", line: line)
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/graphql", line: line)
        assertMethod(of: request, isEqualTo: "POST", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/", line: line)
        assertBody(
            of: request,
            isEqualToJSON: [
            "query": """
            {
                user {
                    username
                    isCurrentUserPremium
                }
            }
            """,
            "variables": [:]
            ],
            line: line
        )
        assertContentType(of: request, isEqualTo: .applicationJSON, line: line)
    }
}
