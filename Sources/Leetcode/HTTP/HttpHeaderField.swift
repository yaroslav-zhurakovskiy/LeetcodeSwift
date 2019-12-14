import Foundation

struct HttpHeaderField {
    let value: String
    
    init(_ value: String) {
        self.value = value
    }
}

extension HttpHeaderField {
    static let requestedWith = HttpHeaderField("X-Requested-With")
    static let XCSRFTokenHeader = HttpHeaderField("X-CSRFToken")
    static let referer = HttpHeaderField("Referer")
    static let origin = HttpHeaderField("Origin")
    static let cookie = HttpHeaderField("Cookie")
    static let contentType = HttpHeaderField("Content-type")
}

extension URLRequest {
    mutating func setValue(_ value: String, forHTTPHeaderField field: HttpHeaderField) {
        setValue(value, forHTTPHeaderField: field.value)
    }
}
