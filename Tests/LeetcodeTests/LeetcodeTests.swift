import XCTest
import Leetcode

final class LeetcodeTests: XCTestCase {
    let leetcode = Leetcode()
    
    func __testGetUserInfo() {
        runTest { exp in
            leetcode.getUserInfo { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func __testGetFavorites() {
        runTest { exp in
            leetcode.getFavorites { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func __testDeleteFavoriteQuestion() {
        runTest { exp in
            let id = FavoriteQuestionID(
                favoriteIDHash: "xl1kmuc2",
                questionID: 6
            )
            leetcode.deleteFavoriteQuestion(by: id) { result in
               assertSuccess(result)
               exp.fulfill()
           }
        }
    }
    
    func __testAddQuestionToFavorite() {
        runTest { exp in
            leetcode.addQuestion(withID: 6, toFavorite: "xl1kmuc2") { result in
               assertSuccess(result)
               exp.fulfill()
           }
        }
    }
    
    func __testAddQuestionToNewFavorite() {
        runTest { exp in
            leetcode.addQuestion(
                withID: 6,
                toNewFavoriteNamed: "Test",
                isPublic: false,
                completion: { result in
                    assertSuccess(result)
                    exp.fulfill()
                }
            )
        }
    }
    
    func __testGetProblemsForCategory() {
        runTest { exp in
            leetcode.getProblems(forCategory: "algorithms") { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func __testDeleteFavoriteList() {
        runTest { exp in
            leetcode.addQuestion(
                withID: 1,
                toNewFavoriteNamed: "Test",
                isPublic: false
            ) { [weak self] result in
                switch result {
                case .success(let id):
                    self?.leetcode.deleteFavoriteList(byHashID: id) { result in
                        assertSuccess(result)
                        exp.fulfill()
                    }
                case .networkFailure(let error):
                    XCTAssertNil(error)
                    exp.fulfill()
                case .someFailure(let error):
                    XCTAssertNil(error)
                    exp.fulfill()
                }
            }
        }
    }
    
    func __testInterpretSolution() {
        runTest { exp in
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
                for: 1,
                code: Code(text: code, lang: .cpp),
                input: input,
                judge: .small
            )
            leetcode.interpretSolution(
                solution,
                forProblem: "two-sum",
                completion: { result in
                    assertSuccess(result)
                    exp.fulfill()
                }
            )
        }
    }
    
    func __testTestSolution() {
       runTest { exp in
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
                for: 1,
                code: Code(text: code, lang: .cpp),
                input: input,
                judge: .small
            )
            leetcode.testSolution(
                solution,
                forProblem: "two-sum",
                completion: { result in
                    assertSuccess(result)
                    exp.fulfill()
                }
            )
        }
    }
    
    func __testDetailsForProblem() {
        runTest { exp in
            leetcode.details(forProblem: "two-sum") { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
    
    func testLogin() {
        runTest { exp in
            let credentials = LoginGredenetials(
                login: "yaroslav@gmail.com",
                password: "123456"
            )
            leetcode.login(using: credentials) { result in
                assertSuccess(result)
                exp.fulfill()
            }
        }
    }
}
