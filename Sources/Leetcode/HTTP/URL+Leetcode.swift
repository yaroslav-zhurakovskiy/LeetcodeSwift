import Foundation

public extension URL {
    init(leetcodePath path: String) {
        self.init(string: String(leetcodePath: path))!
    }
}

extension String {
    init(leetcodePath path: String) {
        let base = "https://\(LeetcodeConfiguration.region.rawValue).com"
        self = "\(base)\(normalizedPath(path))"
    }
}

private func normalizedPath(_ path: String) -> String {
    if !path.starts(with: "/") {
        return "/" + path
    } else {
        return path
    }
}

public enum LeetcodeRegion: String {
    case world = "leetcode"
    case china = "leetcode-ch"
}

public struct LeetcodeConfiguration {
    private init() { }
    
    public static var region: LeetcodeRegion = .world
    
}
