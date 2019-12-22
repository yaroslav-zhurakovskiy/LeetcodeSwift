//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

public protocol LeetcodeWrappingError: LeetcodeError {
    associatedtype ErrorType: Error = Error
    
    var originalError: ErrorType { get }
}

public extension LeetcodeWrappingError {
    var localizedDescription: String {
        return originalError.localizedDescription
    }
    
    var debugDescription: String {
        return (originalError as CustomDebugStringConvertible).debugDescription
    }
}

public struct LeetcoeJSONDecodingError: LeetcodeWrappingError {
    public let response: HTTPURLResponse
    public let body: String
    public let originalError: Error
    
    init(
        data: Data,
        response: HTTPURLResponse,
        decodingError: Error
    ) {
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.originalError = decodingError
    }
}
