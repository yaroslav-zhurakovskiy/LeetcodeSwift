import Foundation

extension URLRequest {
    mutating func setJSONBody(_ body: Any) throws {
        httpBody = try JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        setContentType(.applicationJSON)
    }
    
    mutating func setJSONBody<Body: Encodable>(_ body: Body) throws {
        let encoder = JSONEncoder()
        httpBody = try encoder.encode(body)
        setContentType(.applicationJSON)
    }
}

extension URLRequest {
    mutating func setFormData(_ values: [String: String]) {
        let str = values.keys
            .map { "\($0)=\(values[$0]!)" }
            .joined(separator: ",")
        httpBody = str.data(using: .utf8)
    }
}

extension URLRequest {
    mutating func setCookie(_ cookies: [HTTPCookie]) {
        // TODO: Fix
        let value = cookies.map { "\($0.name)=\($0.value)" }.joined(separator: ";")
        setValue(value, forHTTPHeaderField: .cookie)
    }
}

extension URLRequest {
    init(leetcodePath path: String) {
        self.init(url: .init(leetcodePath: path))
        
        setValue("XMLHttpRequest", forHTTPHeaderField: .requestedWith)
    }
}
