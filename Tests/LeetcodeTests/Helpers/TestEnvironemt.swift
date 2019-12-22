//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import Leetcode

struct TestEnvironemt {
    private init() { }
    
    static var region: LeetcodeRegion {
        guard let region = ProcessInfo.processInfo.environment["LEETCODE_REGION"] else {
            print("'LEETCODE_REGION' envrionemt variable is missing. Using world.")
            return .world
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
    
    static var sessionToken: String {
        guard let token = ProcessInfo.processInfo.environment["LEETCODE_SESSION_TOKEN"] else {
            print("'LEETCODE_SESSION_TOKEN' envrionemt variable is missing")
            return ""
        }
        
        return token
    }
}
