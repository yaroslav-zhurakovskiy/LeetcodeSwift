import XCTest
@testable import Leetcode
import Foundation

class GetFavoritesTests: LeetcodeTestCase {  
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(
            bodyStub: .getFavoritesSuccess,
            statusCode: 200
        )
        
        var result: Result<Favorites, Error>!
        leetcode.getFavorites { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        let value = retreiveValue(fromResult: result)
        XCTAssertEqual(value.user_name, "yaroslavz")
        XCTAssertGreaterThan(value.favorites.leetcode_favorites.count, 0)
        XCTAssertEqual(value.favorites.private_favorites.count, 0)
        XCTAssertGreaterThan(value.favorites.public_favorites.count, 0)
        
        assertFavorite(
            value.favorites.public_favorites[0],
            hasIDHash: "xipm41yr",
            name: "AddQuestionToFavorite",
            description: "",
            questions: [
                (
                    id: 1,
                    title: "Two Sum",
                    titleSlug: "two-sum"
                )
            ],
            is_public_favorite: true,
            view_count: 1,
            creator: "yaroslavz",
            current_user: "",
            is_watched: false
        )
    }
    
    func assertFavorite(
        _ favorite: Favorites.Favorite,
        hasIDHash: String,
        name: String,
        description: String,
        questions: [(id: Int, title: String, titleSlug: String)],
        is_public_favorite: Bool,
        view_count: Int,
        creator: String,
        current_user: String,
        is_watched: Bool,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(favorite.id_hash, hasIDHash, file: file, line: line)
        XCTAssertEqual(favorite.name, name, file: file, line: line)
        XCTAssertEqual(favorite.description, description, file: file, line: line)
        XCTAssertEqual(favorite.questions.count, questions.count, "Number of questions", file: file, line: line)
        for index in 0..<questions.count {
            let expected = questions[index]
            let actual = favorite.questions[index]
            XCTAssertEqual(
                actual.id,
                expected.id,
                "question #\(index) - Id",
                file: file,
                line: line
            )
            XCTAssertEqual(
                actual.title,
                expected.title,
                "question #\(index) - Title",
                file: file,
                line: line
            )
            XCTAssertEqual(
                actual.title_slug,
                expected.titleSlug,
                "question #\(index) - Title slug ",
                file: file,
                line: line
            )
        }
        
        XCTAssertEqual(
            favorite.is_public_favorite,
            is_public_favorite,
            "is_public_favorite",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.view_count,
            view_count,
            "view_count",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.creator,
            creator,
            "creator",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.current_user,
            current_user,
            "current_user",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.is_watched,
            is_watched,
            "is_watched",
            file: file,
            line: line
        )
    }
    
    func testUnathorized() throws {
        try urlSessionSpy.setSuccessResult(
            bodyStub: .empty,
            statusCode: 401
        )
        
        var result: Result<Favorites, Error>!
        leetcode.getFavorites { result = $0 }
        
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        let _ = retreiveError(fromResult: result, as: LeetcodeUnauthorized.self)
    }
    
    func testDecodingError() {
        XCTFail("Implement")
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Favorites, Error>!
        leetcode.getFavorites { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        XCTAssertEqual(urlSessionSpy.requests.count, 1, "Number of requests", line: line)
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/list/api/questions", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/list/api/questions", line: line)
        assertMethod(of: request, isEqualTo: "GET", line: line)
    }
}
