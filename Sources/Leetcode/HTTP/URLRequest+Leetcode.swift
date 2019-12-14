//
//  File.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

struct ContentType: ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    public let value: String
    
    init(stringLiteral value: Self.StringLiteralType) {
        self.value = value
    }
}

extension ContentType {
    static let applicationJSON: ContentType = "application/json"
    static let multipartFormData: ContentType = "multipart/form-data"
}

extension URLRequest {
    init(
        leetcodeURL url: URL,
        cookie: String,
        xcsrfToken: String,
        origin: String,
        referer: String
    ) {
        self.init(url: url)
        
        allHTTPHeaderFields = [
          "Cookie": cookie,
          "X-CSRFToken": xcsrfToken,
          "X-Requested-With": "XMLHttpRequest",
          "Origin": origin,
          "Referer": referer
        ]
    }
    
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
    
    mutating func setContentType(_ type: ContentType) {
        setValue("Content-type", forHTTPHeaderField: type.value)
    }
    
    mutating func setConnectionKeepAlive() {
        setValue("keep-alive", forHTTPHeaderField: "Connection")
    }
    
    mutating func setFormData(_ values: [String: String]) {
        let str = values.keys
            .map { "\($0)=\(values[$0]!)" }
            .joined(separator: ",")
        httpBody = str.data(using: .utf8)
    }
    
}

extension URL {
    init(leetcodePath path: String) {
        self.init(string: String(leetcodePath: path))!
    }
}

public extension String {
    init(leetcodePath path: String) {
        let base = "https://leetcode.com"
        self = "\(base)\(normalizedPath(path))"
    }
}

private func normalizedPath(_ path: String) -> String {
    if !path.starts(with: "/") {
        return "/" + path
    } else {
        return path
    }
}
