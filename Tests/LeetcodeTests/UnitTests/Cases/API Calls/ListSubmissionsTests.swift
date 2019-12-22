//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
@testable import Leetcode
import Foundation

class ListSubmissionsTests: LeetcodeTestCase {
    let problemSlug = "slug"
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .listSubmissionsSuccess, statusCode: .any)
        
        var result: Result<[SubmissionDumpRecord], Error>!
        leetcode.listSubmissions(forProblemWithSlug: problemSlug) { result = $0}
        
        XCTAssertNotNil(result)
        assertCorrectRequest()
        assertSuccess(result)
        let list = retreiveValue(fromResult: result)
        
        XCTAssertGreaterThan(list.count, 0)
        let value = list[0]
        XCTAssertEqual(value.id, 0)
        XCTAssertEqual(value.time, "time")
        XCTAssertEqual(value.timestamp, 0)
        XCTAssertEqual(value.status_display, "status_display")
        XCTAssertEqual(value.runtime, "runtime")
        XCTAssertEqual(value.url, "url")
        XCTAssertEqual(value.is_pending, "is_pending")
        XCTAssertEqual(value.title, "title")
        XCTAssertEqual(value.memory, "memory")
        XCTAssertEqual(value.compare_result, "compare_result")
        XCTAssertEqual(value.lang, "lang")
        XCTAssertEqual(value.code, "code")
        XCTAssertEqual(value.url, "url")
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)

        var result: Result<[SubmissionDumpRecord], Error>!
        leetcode.listSubmissions(forProblemWithSlug: problemSlug) { result = $0}

        assertCorrectRequest()
        XCTAssertNotNil(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(testError === error)
    }

    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest()
        let request = urlSessionSpy.requests[0]
        assertURL(
            of: request,
            isEqualToLeetcodePath: "/api/submissions/\(problemSlug)",
            line: line
        )
        assertMethod(of: request, isEqualTo: "GET", line: line)
        assertOrigin(
            of: request,
            isEqualToLeetcodePath: "/",
            line: line
        )
        assertReferer(
            of: request,
            isEqualToLeetcodePath: "/problems/\(problemSlug)/submissions/",
            line: line
        )
        assertEmptyBody(of: request)
    }
}
