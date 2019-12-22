public struct LeetcodeUnauthorized: LeetcodeError, CustomDebugStringConvertible {
    public init() {
        
    }
    
    public var localizedDescription: String {
        return "401 Unauthorized"
    }
}
