//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

extension Leetcode {
    func fetchCookies(
        for path: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let request = requestBuilder.build(
            path: path,
            method: .head
        )
        urlSession.request(request, completion: { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
