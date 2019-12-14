//
//  File.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public protocol TestCaseInputParamConvertible {
    var testCaseInputParamValue: String { get }
}

extension String: TestCaseInputParamConvertible {
    public var testCaseInputParamValue: String {
        return "\"\(self)\""
    }
}

extension Array: TestCaseInputParamConvertible  where Element: TestCaseInputParamConvertible {
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

public struct TestCaseInput {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(from params: [TestCaseInputParamConvertible]) {
        self.rawValue = params
            .compactMap { $0.testCaseInputParamValue }
            .joined(separator: "\n")
    }
}
