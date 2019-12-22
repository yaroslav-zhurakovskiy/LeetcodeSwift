import Foundation

struct LeetcodePaidUserOnly: LeetcodeHTTPResponseError {
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
        return "Paid users only"
    }
}
