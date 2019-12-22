//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

public struct LeetcodeTooManyRequests: LeetcodeHTTPResponseError {
    private let body: Data
    public let response: HTTPURLResponse
    
    public init(body: Data, response: HTTPURLResponse) {
        self.body = body
        self.response = response
    }
    
    public var responseBody: String {
        return String(data: body, encoding: .utf8) ?? ""
    }
    
    var localizedDescription: String {
        return "\(response.statusCode) Too Many Requests"
    }
}
