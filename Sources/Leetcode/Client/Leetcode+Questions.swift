extension Leetcode {
    public func addQuestion(
        withID questionID: Int,
        toFavoriteListWithIDHash idHash: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let query = """
        mutation addQuestionToFavorite($favoriteIdHash: String!, $questionId: String!)
        {
            addQuestionToFavorite(favoriteIdHash: $favoriteIdHash, questionId: $questionId)
            {
                ok
                error
            }
        }
        """
        let params = LeetcodeGraphqlRequestParams(
            query: query,
            variables: [
                "favoriteIdHash": "\(idHash)",
                "questionId": "\(questionID)"
            ],
            operationName: "addQuestionToFavorite"
        )
        
        // TODO: Fix referer path
        graphqlRequest(
            using: params,
            method: .post,
            origin: "/",
            referer: "/",
            responseType: AddQuestionToFavoriteDataWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    let info = wrapper.data.addQuestionToFavorite
                    if info.ok {
                        completion(.success(()))
                    } else if let error = info.error {
                        let error = SomeLeetcodeError(localizedDescription: error)
                        completion(.failure(error))
                    }
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
    
    public func addQuestion(
        withID questionID: Int,
        toNewFavoriteList list: NewFavoriteList,
        completion: @escaping (Result<AddQuestionResponse, Error>) -> Void
    ) {
        let query = """
        mutation addQuestionToNewFavorite($name: String!, $isPublicFavorite: Boolean!, $questionId: String!)
        {
            addQuestionToNewFavorite(name: $name, isPublicFavorite: $isPublicFavorite, questionId: $questionId)
                {
                    ok
                    error
                    favoriteIdHash
                }
        }
        """
        let params = LeetcodeGraphqlRequestParams(
            query: query,
            variables: [
                "questionId": "\(questionID)",
                "isPublicFavorite": list.isPublic ? "true" : "false",
                "name": list.name
            ],
            operationName: "addQuestionToNewFavorite"
        )
        graphqlRequest(
            using: params,
            method: .post,
            origin: "/",
            referer: "/",
            responseType: AddQuestionToNewFavoriteDataWrapper.self,
            completion: { result in
                switch result {
                case .success(let wrapper):
                    let info = wrapper.data.addQuestionToNewFavorite
                    if info.ok, let id = info.favoriteIdHash {
                        completion(.success(AddQuestionResponse(favoriteIdHash: id)))
                    } else if let error = info.error {
                        let error = SomeLeetcodeError(localizedDescription: error)
                        completion(.failure(error))
                    }
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
