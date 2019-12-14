import Foundation

public extension Leetcode {
    func fetchCookies(
        for path: String,
        completion: @escaping (Result<[HTTPCookie], Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: path,
            method: .head
        )
        urlSession.request(request, completion: { result in
            switch result {
            case .success(_, let response):
                let cookies = HTTPCookie.cookies(from: response)
                completion(.success(cookies))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
