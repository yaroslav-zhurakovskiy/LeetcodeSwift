//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

public protocol DateProvider {
    var now: Date { get }
}

public struct SystemDateProvider: DateProvider {
    public init() {
        
    }
    
    public var now: Date {
        return Date()
    }
}

public struct DateProviderHolder {
    public static var current: DateProvider = SystemDateProvider()
}
