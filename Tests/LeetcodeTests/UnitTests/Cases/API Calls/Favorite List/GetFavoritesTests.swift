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
            matches: .init(
                id_hash: "xipm41yr",
                name: "AddQuestionToFavorite",
                description: "",
                questions: [
                    .init(
                        id: 1,
                        title: "Two Sum",
                        title_slug: "two-sum"
                    )
                ],
                is_public_favorite: true,
                view_count: 1,
                creator: "yaroslavz",
                current_user: "",
                is_watched: false
            )
        )
    }
    
    func assertFavorite(
        _ favorite: Favorites.FavoriteList,
        matches list: Favorites.FavoriteList,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(favorite.id_hash, list.id_hash, file: file, line: line)
        XCTAssertEqual(favorite.name, list.name, file: file, line: line)
        XCTAssertEqual(favorite.description, list.description, file: file, line: line)
        XCTAssertEqual(favorite.questions.count, list.questions.count, "Number of questions", file: file, line: line)
        for index in 0..<list.questions.count {
            let expected = list.questions[index]
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
                expected.title_slug,
                "question #\(index) - Title slug ",
                file: file,
                line: line
            )
        }
        
        XCTAssertEqual(
            favorite.is_public_favorite,
            list.is_public_favorite,
            "is_public_favorite",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.view_count,
            list.view_count,
            "view_count",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.creator,
            list.creator,
            "creator",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.current_user,
            list.current_user,
            "current_user",
            file: file,
            line: line
        )
        XCTAssertEqual(
            favorite.is_watched,
            list.is_watched,
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
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: LeetcodeUnauthorized.self)
        XCTAssertNotNil(error)
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
