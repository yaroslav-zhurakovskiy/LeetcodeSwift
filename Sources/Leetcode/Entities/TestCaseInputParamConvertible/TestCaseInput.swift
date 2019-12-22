//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

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

public extension TestCaseInput {
    static let empty = TestCaseInput(from: [])
}
