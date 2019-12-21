import Foundation
import Leetcode

struct TestEnvironemt {
    private init() { }
    
    static var region: LeetcodeRegion {
        guard let region = ProcessInfo.processInfo.environment["LEETCODE_REGION"] else {
            fatalError("'LEETCODE_REGION' envrionemt variable is missing")
        }
        
        switch region {
        case "world":
            return .world
        case "china":
            return .china
        default:
            fatalError("Unknown value '\(region)' for 'LEETCODE_REGION' envrionemt variable")
        }
    }
    
    static var timeout: TimeInterval {
        return 120
    }
}
