import XCTest
import Foundation
import Leetcode

func assertBody(
    of request: URLRequest,
    isEqualToJSON expectedJSON: [String: Any],
    file: StaticString = #file,
    line: UInt = #line
) {
    do {
        XCTAssertNotNil(request.httpBody, file: file, line: line)
        let bodyJSON = try JSONSerialization.jsonObject(with: request.httpBody!, options: []) as? [String: Any]
        XCTAssertNotNil(bodyJSON, "Http body must be json", file: file, line: line)
        
        XCTAssertEqual(bodyJSON!.keys.count, expectedJSON.keys.count, "Number of fields", file: file, line: line)
        
        for key in expectedJSON.keys {
            guard let actualValue = bodyJSON![key], let expectedValue = expectedJSON[key] else {
                XCTFail("Field '\(key)' is missing", file: file, line: line)
                continue
            }
            
            if let actualString = actualValue as? String, let expecteString = expectedValue as? String {
                XCTAssertEqual(actualString, expecteString, formatValueDontMatch(forKey: key), file: file, line: line)
            } else if let actualNumber = actualValue as? Int, let expectedNumber = expectedValue as? Int {
                XCTAssertEqual(actualNumber, expectedNumber, formatValueDontMatch(forKey: key), file: file, line: line)
            } else if let actualDict = actualValue as? NSDictionary, let expectedDict = expectedValue as? NSDictionary {
                XCTAssertEqual(actualDict, expectedDict, formatValueDontMatch(forKey: key), file: file, line: line)
            } else if let actualBool = actualValue as? Bool, let expectedBool = expectedValue as? Bool {
                XCTAssertEqual(actualBool, expectedBool, formatValueDontMatch(forKey: key), file: file, line: line)
            }
        }
        
    } catch let error {
        XCTAssertNil(error, file: file, line: line)
    }
}

private func formatValueDontMatch(forKey key: String) -> String {
    return "Values of '\(key)' don't match"
}

func assertEmptyBody(
    of request: URLRequest,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertNil(request.httpBody, "Body", file: file, line: line)
}

func assertOrigin(
    of request: URLRequest,
    isEqualToLeetcodePath path: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    
    assertOrigin(of: request, isEqualTo: String(leetcodePath: path), file: file, line: line)
}

func assertReferer(
    of request: URLRequest,
    isEqualToLeetcodePath path: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertReferer(of: request, isEqualTo: String(leetcodePath: path), file: file, line: line)
}


func assertOrigin(
    of request: URLRequest,
    isEqualTo origin: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertHeader("Origin", of: request, isEqualTo: origin, file: file, line: line)
}

func assertReferer(
    of request: URLRequest,
    isEqualTo origin: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertHeader("Referer", of: request, isEqualTo: origin, file: file, line: line)
}

func assertHeader(
    _ header: String,
    of request: URLRequest,
    isEqualTo value: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    let headers = request.allHTTPHeaderFields ?? [:]
    XCTAssertEqual(headers[header] ?? "", value, "\(header) header", file: file, line: line)
}

// TODO: Move out
func assertMethod(
    of request: URLRequest,
    isEqualTo method: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual(request.httpMethod ?? "", method, "Method", file: file, line: line)
}

// TODO: Move out
func assertURL(
    of request: URLRequest,
    isEqualToLeetcodePath path: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertURL(of: request, isEqualTo: String(leetcodePath: path), file: file, line: line)
    XCTAssertNotNil(request.url, file: file, line: line)
}

func assertURL(
    of request: URLRequest,
    isEqualTo url: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertNotNil(request.url, "URL", file: file, line: line)
    XCTAssertEqual(request.url!.absoluteString, url, "URL path", file: file, line: line)
}

func assertContentType(
    of request: URLRequest,
    isEqualTo value: ContentType,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertHeader(
        "Content-Type",
        of: request,
        isEqualTo: value.value,
        file: file,
        line: line
    )
}

extension String {
    init(leetcodePath path: String) {
        self = "https://leetcode.com\(normalizedPath(path))"
    }
}

private func normalizedPath(_ path: String) -> String {
    if !path.starts(with: "/") {
        return "/" + path
    } else {
        return path
    }
}
