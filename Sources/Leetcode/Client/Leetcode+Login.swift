import Foundation

public extension Leetcode {
    func login(usingSessionCookie cookie: HTTPCookie, completion: @escaping (Result<Void, Error>) -> Void) {
        fetchCookies { [weak self] result in
            switch result {
            case .success:
                self?.cookieStorage.setCookie(cookie)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchCookies(completion: @escaping (Result<Void, Error>) -> Void) {
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
