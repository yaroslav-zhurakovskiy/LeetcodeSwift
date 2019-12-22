//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

extension NSNumber: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension NSString: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\"\(self)\""
    }
}

extension NSNull: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "null"
    }
}
