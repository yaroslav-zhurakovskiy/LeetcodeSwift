import Foundation

public protocol TestCaseInputParamConvertible {
    var testCaseInputParamValue: String { get }
}

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

extension Bool: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
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

extension Optional: TestCaseInputParamConvertible where Wrapped: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        switch self {
        case .some(let value):
            return value.testCaseInputParamValue
        case .none:
            return "null"
        }
    }
}

extension NSNumber: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension NSString: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\(self)"
    }
}

extension NSNull: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "null"
    }
}
