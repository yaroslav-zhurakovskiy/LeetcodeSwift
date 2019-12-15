public struct LeetcodeGraphqlRequestParams: Codable {
    public let operationName: String?
    public let variables: [String: String]
    public let query: String
    
    public init(
        query: String,
        variables: [String: String] = [:],
        operationName: String? = nil
    ) {
        self.query = query
        self.variables = variables
        self.operationName = operationName
    }
}
