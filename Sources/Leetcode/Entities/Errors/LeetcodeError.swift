public protocol LeetcodeError: Error, CustomDebugStringConvertible {
    
}

public extension LeetcodeError {
    var debugDescription: String {
        return localizedDescription
    }
}
