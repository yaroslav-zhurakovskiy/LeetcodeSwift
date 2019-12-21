import Foundation

public extension Leetcode {
    func login(usingSessionCookie cookie: HTTPCookie, completion: @escaping (Result<Void, Error>) -> Void) {
        fetchCookies { result in
            switch result {
            case .success(let cookies):
                let storage = HTTPCookieStorageFactoryHolder.current.create()
                (cookies + [cookie]).forEach(storage.setCookie(_:))
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(usingSessionCookieValue value: String, expires: Date, completion: @escaping (Result<Void, Error>) -> Void) {
        let cookie = HTTPCookie(properties: [
            .name: LeetcodeConstants.sessionCookieName,
            .value: value,
            .expires: expires,
            .domain: ".leetcode.com",
            .path: "/",
            .secure: true,
            HTTPCookiePropertyKey("SameSite"): "Lax",
            HTTPCookiePropertyKey("HttpOnly"): true,
        ])!
        login(usingSessionCookie: cookie, completion: completion)
    }
    
    private func fetchAndSaveCookies(completion: @escaping (Result<Void, Error>) -> Void) {
        fetchCookies { result in
            switch result {
            case .success(let cookies):
                let storage = HTTPCookieStorageFactoryHolder.current.create()
                cookies.forEach(storage.setCookie(_:))
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    private func fetchCookies(completion: @escaping (Result<[HTTPCookie], Error>) -> Void) {
        fetchCookies(for: "/accounts/login/", completion: completion)
    }
}

public extension Leetcode {
    func logout() {
        if let cookie = findSessionCookie() {
            cookieStorage.deleteCookie(cookie)
        }
    }
    
    var isLoggedIn: Bool {
        return findSessionCookie() != nil
    }
    
    private func findSessionCookie() -> HTTPCookie? {
        if let cookies = cookieStorage.cookies {
            return cookies.first(where: { $0.name == LeetcodeConstants.sessionCookieName })
        } else {
            return nil
        }
    }
}
