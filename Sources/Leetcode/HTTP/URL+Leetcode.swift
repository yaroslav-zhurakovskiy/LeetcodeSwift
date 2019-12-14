import Foundation

extension URL {
    init(leetcodePath path: String) {
        self.init(string: String(leetcodePath: path))!
    }
}

public extension String {
    init(leetcodePath path: String) {
        let base = "https://leetcode.com"
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
