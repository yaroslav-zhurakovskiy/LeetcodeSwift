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
        var temp = allHTTPHeaderFields ?? [:]
        temp["Content-type"] = type.value
        allHTTPHeaderFields = temp
    }
    
    mutating func setConnectionKeepAlive() {
        var temp = allHTTPHeaderFields ?? [:]
        temp["Connection"] = "keep-alive"
        allHTTPHeaderFields = temp
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
