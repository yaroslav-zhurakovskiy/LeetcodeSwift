public struct InterpretSolutionResponse: Decodable {
    public let interpret_id: String
    public let test_case: String
}

public enum InterpretSolutionError: Error {
    case paidResourceAccess
    case decodingFailure(HTTPURLResponseDecodingError)
    case networkFailure(Error)
}
