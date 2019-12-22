//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
@testable import Leetcode
import Foundation

class GetAllProblemsTests: LeetcodeTestCase {
    private let category = "all"
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(
            bodyStub: .getProblemsSuccess,
            statusCode: 200
        )
        
        var result: Result<GetProblemsResponse, Error>!
        leetcode.getAllProblems { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
        
        let value = retreiveValue(fromResult: result)
        
        XCTAssertEqual(value.user_name, "test")
        XCTAssertEqual(value.num_solved, 0)
        XCTAssertEqual(value.num_total, 4)
        XCTAssertEqual(value.ac_easy, 0)
        XCTAssertEqual(value.ac_medium, 0)
        XCTAssertEqual(value.ac_hard, 0)
        XCTAssertGreaterThan(value.stat_status_pairs.count, 0)
        let pair = value.stat_status_pairs[0]
        XCTAssertEqual(pair.paid_only, false)
        XCTAssertEqual(pair.is_favor, false)
        XCTAssertEqual(pair.frequency, 0)
        XCTAssertEqual(pair.progress, 0)
        XCTAssertEqual(pair.status, nil)
        XCTAssertEqual(pair.difficulty.level, 1)
        let stat = pair.stat
        XCTAssertEqual(stat.question_id, 195)
        XCTAssertEqual(stat.question__article__live, nil)
        XCTAssertEqual(stat.question__article__slug, nil)
        XCTAssertEqual(stat.question__title, "Tenth Line")
        XCTAssertEqual(stat.question__title_slug, "tenth-line")
        XCTAssertEqual(stat.question__hide, false)
        XCTAssertEqual(stat.total_acs, 45906)
        XCTAssertEqual(stat.total_submitted, 135911)
        XCTAssertEqual(stat.frontend_question_id, 195)
        XCTAssertEqual(stat.is_new_question, false)
    }
    
    func testFailure() {
        urlSessionSpy.setFailureResult(error: TestError.shared)
        
        var result: Result<GetProblemsResponse, Error>!
        leetcode.getAllProblems { result = $0 }
        
        assertCorrectRequest()
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === TestError.shared)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest(line: line)
        
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/api/problems/\(category)/")
        assertMethod(of: request, isEqualTo: "GET")
        assertOrigin(of: request, isEqualToLeetcodePath: "/api/problems/\(category)/")
        assertReferer(of: request, isEqualToLeetcodePath: "/api/problems/\(category)/")
        assertContentType(of: request, isEqualTo: .applicationJSON)
        assertEmptyBody(of: request)
    }
}
