import Leetcode
import XCTest

func assertSuccess<V, E>(
    _ result : Result<V, E>,
    file: StaticString = #file,
    line: UInt = #line
) {
    if case .failure = result {
        XCTFail(
            "\(result) is not equal to .success",
            file: file,
            line: line
        )
    }
}

func assertSuccess(
    _ result : DeleteFavoriteResult,
    file: StaticString = #file,
    line: UInt = #line
) {
    
    switch result {
    case .networkFailure, .someFailure:
        XCTFail(
            "\(result) is not equal to .success",
            file: file,
            line: line
        )
    case .success:
        // Do nothing
        break
    }
}

func assertSuccess(
    _ result : AddQuestionToFavoriteResult,
    file: StaticString = #file,
    line: UInt = #line
) {
    
    switch result {
    case .networkFailure, .someFailure:
        XCTFail(
            "\(result) is not equal to .success",
            file: file,
            line: line
        )
    case .success:
        // Do nothing
        break
    }
}


func assertSuccess(
    _ result : AddQuestionToNewFavoriteResult,
    file: StaticString = #file,
    line: UInt = #line
) {
    
    switch result {
    case .networkFailure, .someFailure:
        XCTFail(
            "\(result) is not equal to .success",
            file: file,
            line: line
        )
    case .success:
        // Do nothing
        break
    }
}

