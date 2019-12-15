import XCTest
import Leetcode

class GetUserInfoTest: XCTestCase {
    var leetcode: Leetcode!
    var urlSessionSpy: LeetcodeURLSessionSpy!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        urlSessionSpy = LeetcodeURLSessionSpy()
        leetcode = Leetcode()
        leetcode.urlSession = urlSessionSpy
    }
    
    func testSucessGetUserInfo() throws {
        var result: GetUserInfoResult!
        try urlSessionSpy.setSuccessResult(bodyStub: .getUserInfoSuccess, statusCode: 200)
        
        leetcode.getUserInfo { result = $0 }
        
        XCTAssertEqual(urlSessionSpy.requests.count, 1)
        let request = urlSessionSpy.requests[0]
        
        assertURL(of: request, isEqualToLeetcodePath: "/graphql")
        assertMethod(of: request, isEqualTo: "POST")
        assertOrigin(of: request, isEqualToLeetcodePath: "/")
        assertReferer(of: request, isEqualToLeetcodePath: "/")
        assertBody(of: request, isEqualToJSON: [
            "query": """
            {
                user {
                    username
                    isCurrentUserPremium
                }
            }
            """,
            "variables": [:]
        ])
        assertContentType(of: request, isEqualTo: .applicationJSON)
        
        assertSuccess(result)
        let info = retreiveValue(fromResult: result)
        XCTAssertTrue(info.isCurrentUserPremium)
        XCTAssertEqual(info.username, "username")
    }
    
    func testTestFailureUserInfo() {
        var result: GetUserInfoResult!
        urlSessionSpy.setFailureResult(error: TestError.shared)
        
        leetcode.getUserInfo { result = $0 }
        
        XCTAssertEqual(urlSessionSpy.requests.count, 1)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === TestError.shared)
    }
}
