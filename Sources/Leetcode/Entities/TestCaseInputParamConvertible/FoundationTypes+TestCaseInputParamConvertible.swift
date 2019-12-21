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
