import Foundation

public struct LoginGredenetials {
    public let login: String
    public let password: String
    
    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

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
    
    func login(
        using credentials: LoginGredenetials,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        fetchAndSaveCookies { [weak self] result in
            switch result {
            case .success:
                self?.actualLogin(using: credentials, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func actualLogin(
        using credentials: LoginGredenetials,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: "/accounts/login/",
            method: .post,
            origin: "/",
            referer: "/accounts/login/"
        ) { request in
            request.setFormData([
                "login": credentials.login,
                "password": credentials.password
            ])
        }
        urlSession.request(request) { result in
            switch result {
            case let .success(data, response):
                if response.statusCode == 200 {
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
        let storage = HTTPCookieStorageFactoryHolder.current.create()
        if let cookies = storage.cookies {
            cookies.forEach(storage.deleteCookie(_:))
        }
    }
}
