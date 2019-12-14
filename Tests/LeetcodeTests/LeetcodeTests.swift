import XCTest
@testable import Leetcode

private let defaultHTTPCookieStorageFactory = HTTPCookieStorageFactoryHolder.current
private let twoSumQuestionID = 1
private let twoSumProblem = "two-sum"
private let algorithmsCategory = "algorithms"

final class LeetcodeTests: XCTestCase {
    private var leetcode: Leetcode!
    
    override func setUp() {
        super.setUp()
        
        HTTPCookieStorageFactoryHolder.current = FakeHttpCookieStorageFactory()
        leetcode = Leetcode()
    }
    
    override func tearDown() {
        HTTPCookieStorageFactoryHolder.current = defaultHTTPCookieStorageFactory
        
        super.tearDown()
    }
    
    func testGetUserInfo() {
        runAsyncTest { exp in
            leetcode.getUserInfo { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func testGetFavorites() {
        runAsyncTest { exp in
            leetcode.getFavorites { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func testDeleteFavoriteQuestion() {
        runTestFavoriteList { [weak self] id, fulfill in
            let id = FavoriteQuestionID(favoriteIDHash: id, questionID: twoSumQuestionID)
            self?.leetcode.deleteFavoriteQuestion(by: id) { result in
                assertSuccess(result)
                fulfill()
            }
        }
    }
    
    func testAddQuestionToFavorite() {
        runTestFavoriteList { [weak self] id, fullfil in
            self?.leetcode.addQuestion(withID: 6, toFavorite: id) { result in
                assertSuccess(result)
                fullfil()
            }
        }
    }
    
    func testAddQuestionToNewFavorite() {
        runAsyncTest { exp in
            leetcode.addQuestion(
                withID: twoSumQuestionID,
                toNewFavoriteNamed: "AddQuestionToNewFavorite",
                isPublic: false,
                completion: { [weak self] result in
                    assertSuccess(result)
                    
                    if case .success(let favoriteIdHash) = result {
                        self?.leetcode.deleteFavoriteList(
                            byHashID: favoriteIdHash,
                            completion: { result in
                                assertSuccess(result)
                                exp.fulfill()
                            }
                        )
                    }
                }
            )
        }
    }
    
    func testGetProblemsForCategory() {
        runAsyncTest { exp in
            leetcode.getProblems(forCategory: algorithmsCategory) { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func testDeleteFavoriteList() {
        runAsyncTest { exp in
            createTestFavoriteList(name: "DeleteFavoriteList") { [weak self] result in
                switch result {
                case .success(let favoriteIdHash):
                    self?.leetcode.deleteFavoriteList(byHashID: favoriteIdHash) { result in
                        assertSuccess(result)
                        exp.fulfill()
                    }
                case .someFailure(let error):
                    XCTAssertNil(error)
                    exp.fulfill()
                case .networkFailure(let error):
                    XCTAssertNil(error)
                    exp.fulfill()
                }
            }
        }
    }
    
    func testInterpretSolution() {
        runAsyncTest { exp in
            let code = """
            class Solution {
            public:
                vector<int> twoSum(vector<int>& nums, int target) {
                    return {};
                }
            };
            """
            let input = TestCaseInput(from: [[2,7,11,15], 9])
            let solution = Solution(
                for: twoSumQuestionID,
                code: Code(text: code, lang: .cpp),
                input: input,
                judge: .small
            )
            leetcode.interpretSolution(
                solution,
                forProblem: twoSumProblem,
                completion: { result in
                    assertSuccess(result)
                    exp.fulfill()
                }
            )
        }
    }
    
    func testTestSolution() {
       runAsyncTest { exp in
            let code = """
            class Solution {
            public:
                vector<int> twoSum(vector<int>& nums, int target) {
                    return {};
                }
            };
            """
            let input = TestCaseInput(from: [[2,7,11,15], 9])
            let solution = Solution(
                for: twoSumQuestionID,
                code: Code(text: code, lang: .cpp),
                input: input,
                judge: .small
            )
            leetcode.testSolution(
                solution,
                forProblem: twoSumProblem,
                completion: { result in
                    assertSuccess(result)
                    exp.fulfill()
                }
            )
        }
    }
    
    func testDetailsForProblem() {
        runAsyncTest { exp in
            leetcode.details(forProblem: twoSumProblem) { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func testFetchCookies() {
        runAsyncTest { exp in
            leetcode.fetchCookies(for: "/", completion: { result in
                assertSuccess(result)
                exp.fulfill()
            })
        }
    }
}

private extension LeetcodeTests {
    func runTestFavoriteList(
        testFavoriteListsName: String = #function,
        description: String = #function,
        file: StaticString = #file,
        line: UInt = #line,
        test: @escaping (_ favoriteIdHash: String, _ callback: @escaping () -> Void) -> Void
    ) {
        runTest(description: description) { exp in
            let normalizedName = testFavoriteListsName
                .replacingOccurrences(of: "()", with: "")
                .replacingOccurrences(of: "test", with: "")
            createTestFavoriteList(name: normalizedName) { [weak self] result in
                switch result {
                case .success(let favoriteIdHash):
                    test(favoriteIdHash, {
                        self?.leetcode.deleteFavoriteList(byHashID: favoriteIdHash, completion: { result in
                            assertSuccess(result, file: file, line: line)
                            exp.fulfill()
                        })
                    })
                case .someFailure(let error):
                    XCTAssertNil(error, "CreateTestFavoriteList", file: file, line: line)
                    exp.fulfill()
                case .networkFailure(let error):
                    XCTAssertNil(error, "CreateTestFavoriteList", file: file, line: line)
                    exp.fulfill()
                }
            }
        }
    }
    
    func createTestFavoriteList(name: String, completion: @escaping (AddQuestionToNewFavoriteResult) -> Void) {
        leetcode.addQuestion(
            withID: twoSumQuestionID,
            toNewFavoriteNamed: name,
            isPublic: false,
            completion: completion
        )
    }
}
