import Foundation

public enum LeetcodeHttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case head = "HEAD"
}

struct LeetcodeRequestBuilder {
    private let cookieStorage: HTTPCookieStorage
    
    init() {
        cookieStorage = HTTPCookieStorageFactoryHolder.current.create()
    }
    
    func build(path: String, method: LeetcodeHttpMethod) -> URLRequest {
        var request = URLRequest(url: .init(leetcodePath: path))
        
        request.httpMethod = method.rawValue
        
        return request
    }
    
    
    func build(
        path: String,
        method: LeetcodeHttpMethod,
        origin: String,
        referer: String,
        code: (inout URLRequest) -> Void = { _ in  }
    ) -> URLRequest {
        return try! build(
            path: path,
            method: method,
            origin: origin,
            referer: referer,
            code: { request in
                try simulateError()
                code(&request)
            }
        )
    }
    
    private func simulateError() throws {
        
    }
    
    func build(
        path: String,
        method: LeetcodeHttpMethod,
        origin: String,
        referer: String,
        code: (inout URLRequest) throws -> Void
    ) throws -> URLRequest {
        var request =  URLRequest(leetcodePath: path)
        
        if let cookies = cookieStorage.cookies(for: request.url!) {
            request.setCookie(cookies)
        } else if let cookies = cookieStorage.cookies {
            request.setCookie(cookies)
        }
        
        request.setValue(
            "dIFzjY7FnTGCDiMiKaPmqSseZlm2JG19YajDzyBer0hpdBrk7R1bAT1W5AJMltDs",
            forHTTPHeaderField: .XCSRFTokenHeader
        )
        request.setValue(String(leetcodePath: origin), forHTTPHeaderField: .origin)
        request.setValue(String(leetcodePath: referer), forHTTPHeaderField: .referer)
        
        request.httpMethod = method.rawValue
        
        try code(&request)
        
        return request
    }
    
    func buildGraphql(
        from params: LeetcodeGraphqlRequestParams,
        method: LeetcodeHttpMethod,
        origin: String,
        referer: String
    ) -> URLRequest {
        return build(
            path: "/graphql",
            method: method,
            origin: origin,
            referer: origin
        ) { request in
            var json: [String: Any] = [
                "query": params.query,
                "variables": params.variables
            ]
            
            if let operationName = params.operationName {
                json["operationName"] = operationName
            }
            
            try? request.setJSONBody(json)
        }
    }
}

public struct LeetcodeGraphqlRequestParams: Codable {
    public let operationName: String?
    public let variables: [String: String]
    public let query: String
    
    public init(
        query: String,
        variables: [String: String] = [:],
        operationName: String? = nil
    ) {
        self.query = query
        self.variables = variables
        self.operationName = operationName
    }
}
