//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

extension String: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\"\(self)\""
    }
}

extension Array: TestCaseInputParamConvertible where Element: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "[" + map { $0.testCaseInputParamValue }.joined(separator: ",") + "]"
    }
}

extension Int: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension UInt: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension Bool: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return self ? "true" : "false"
    }
}

extension Float: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension Double: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}
