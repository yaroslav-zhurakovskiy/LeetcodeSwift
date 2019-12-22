//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public protocol LeetcodeError: Error, CustomDebugStringConvertible {
    
}

public extension LeetcodeError {
    var debugDescription: String {
        return localizedDescription
    }
}
