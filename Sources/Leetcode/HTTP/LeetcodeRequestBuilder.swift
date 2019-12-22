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
    
    init(cookieStorage: HTTPCookieStorage) {
        self.cookieStorage = cookieStorage
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
        return (try? build(
            path: path,
            method: method,
            origin: origin,
            referer: referer,
            code: { request in
                try simulateError()
                code(&request)
            }
        ))!
    }
    
    private func simulateError() throws {
        
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
    
    func build(
        path: String,
        method: LeetcodeHttpMethod,
        origin: String,
        referer: String,
        code: (inout URLRequest) throws -> Void
    ) throws -> URLRequest {
        var request =  URLRequest(leetcodePath: path)
        
        if let cookies = self.cookies(for: request) {
            if let cookie = cookies.first(where: { $0.name == "csrftoken" }) {
                request.setValue(cookie.value, forHTTPHeaderField: .XCSRFTokenHeader)
            }
        }
        
        request.setValue(String(leetcodePath: origin), forHTTPHeaderField: .origin)
        request.setValue(String(leetcodePath: referer), forHTTPHeaderField: .referer)
        
        request.httpMethod = method.rawValue
        
        try code(&request)
        
        return request
    }
    
    private func cookies(for request: URLRequest) -> [HTTPCookie]? {
        if let cookies = cookieStorage.cookies(for: request.url!) {
            return cookies
        } else if let cookies = cookieStorage.cookies {
            return cookies
        } else {
            return nil
        }
    }
}
