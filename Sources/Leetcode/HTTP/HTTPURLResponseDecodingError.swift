import Foundation

public struct HTTPURLResponseDecodingError: Error {
    public let data: Data
    public let body: String
    public let response: HTTPURLResponse
    public let decodingError: Error
    
    init(
        data: Data,
        response: HTTPURLResponse,
        decodingError: Error
    ) {
        self.data = data
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.decodingError = decodingError
    }
}


extension HTTPURLResponseDecodingError {
    public var localizedDescription: String {
        return decodingError.localizedDescription
    }
}


extension HTTPURLResponseDecodingError: CustomDebugStringConvertible {
    public var debugDescription: String {
        return (decodingError as CustomDebugStringConvertible).debugDescription
    }
}
