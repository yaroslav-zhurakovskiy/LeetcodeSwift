extension Leetcode {
    public func getUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        let query = """
        {
            user {
                username
                isCurrentUserPremium
            }
        }
        """
        graphqlRequest(
            using: .init(query: query),
            method: .post,
            origin: "/",
            referer: "/",
            responseType: UserInfoDataWrapper.self,
            completion: { result in
                switch result {
                case .success(let info):
                    completion(.success(info.data.user))
                case .decodingFailure(let error):
                    completion(.failure(error))
                case .graphqlError(let error):
                    completion(.failure(error))
                case .networkFailure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
}
