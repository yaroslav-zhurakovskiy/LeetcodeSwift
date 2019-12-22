import Leetcode
import XCTest

func assertSuccess<V, E>(
    _ result: Result<V, E>,
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

func assertFailure<V, E>(
    _ result: Result<V, E>,
    file: StaticString = #file,
    line: UInt = #line
) {
    if case .success = result {
        XCTFail("\(result) is not equal to .failure", file: file, line: line)
    }
}

func retreiveValue<Value, Error>(fromResult result: Result<Value, Error>) -> Value {
    if case .success(let value) = result {
        return value
    } else {
        return Optional<Value>.none!
    }
}

func retreiveError<Value, Error>(fromResult result: Result<Value, Error>) -> Error {
    if case .failure(let error) = result {
        return error
    } else {
        return Optional<Error>.none!
    }
}

func retreiveError<Value, Err: Error, OtherErr: Error>(
    fromResult result: Result<Value, Err>,
    as type: OtherErr.Type,
    file: StaticString = #file,
    line: UInt = #line
) -> OtherErr {
    let error = retreiveError(fromResult: result)
    if let error = error as? OtherErr {
        return error
    } else {
        XCTFail("\(error) is not \(type)", file: file, line: line)
        exit(-1)
    }
}
