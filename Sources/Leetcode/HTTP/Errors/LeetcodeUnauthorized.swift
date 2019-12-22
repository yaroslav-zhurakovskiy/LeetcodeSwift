//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct LeetcodeUnauthorized: LeetcodeError, CustomDebugStringConvertible {
    public init() {
        
    }
    
    public var localizedDescription: String {
        return "401 Unauthorized"
    }
}
