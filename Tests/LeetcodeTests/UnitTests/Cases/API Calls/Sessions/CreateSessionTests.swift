//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
import Leetcode

class CreateSessionTests: LeetcodeTestCase {
    let sesssionName = "SESSION"
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .createSessionSuccess, statusCode: 200)
        
        var result: Result<CreateSessionResponse, Error>!
        leetcode.createSession(withName: sesssionName) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
        let value = retreiveValue(fromResult: result)
        XCTAssertTrue(value.is_full)
        XCTAssertEqual(value.sessions.count, 1)
        let sesion = value.sessions[0]
        XCTAssertEqual(sesion.id, 1)
        XCTAssertTrue(sesion.is_active)
        XCTAssertEqual(sesion.total_acs, 1)
        XCTAssertEqual(sesion.name, "name")
        XCTAssertEqual(sesion.ac_questions, 1)
        XCTAssertEqual(sesion.submitted_questions, 1)
        XCTAssertEqual(sesion.total_submitted, 1)
    }
    
    func testNameAlreadyExists() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .empty, statusCode: 400)
        
        var result: Result<CreateSessionResponse, Error>!
        leetcode.createSession(withName: sesssionName) { result = $0 }

        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: SessionNameAlreadyExists.self)
        XCTAssertEqual(error.name, sesssionName)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<CreateSessionResponse, Error>!
        leetcode.createSession(withName: sesssionName) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest(line: line)
        
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/session", line: line)
        assertMethod(of: request, isEqualTo: "PUT", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/session", line: line)
        assertBody(of: request, isEqualToJSON: ["func": "create", "name": sesssionName], line: line)
        assertContentType(of: request, isEqualTo: .applicationJSON, line: line)
    }
}
