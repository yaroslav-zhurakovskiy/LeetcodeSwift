import Foundation

struct UserInfoData: Decodable {
    struct Data: Decodable {
        let user: UserInfo
    }
    let data: Data
}

public typealias GetUserInfoResult = Result<UserInfo, Error>

public typealias VerificationResult = Result<VerificationInfo, Error>

public typealias GetFavouritesResult = Result<Favorites, Error>

public struct SubmitInfo: Decodable {
    public let submission_id: Int
}

public typealias SubmitResult = Result<SubmitInfo, Error>

public struct SomeLeetcodeError: Error {
    public let localizedDescription: String
}

public enum DeleteFavoriteResult {
    case success
    case someFailure
    case networkFailure(Error)
}

public enum AddQuestionToFavoriteResult {
    case success
    case someFailure(Error)
    case networkFailure(Error)
}

public enum AddQuestionToNewFavoriteResult {
    case success(favoriteIdHash: String)
    case someFailure(Error)
    case networkFailure(Error)
}

public struct AddQuestionToFavoriteDataWrapper: Decodable {
    public struct AddQuestionToFavorite: Decodable {
       public let ok: Bool
       public let error: String?
    }
    
    public struct Data: Decodable {
        public let addQuestionToFavorite: AddQuestionToFavorite
    }
    
    public let data: Data
}

public struct AddQuestionToNewFavoriteDataWrapper: Decodable {
    public struct AddQuestionToFavorite: Decodable {
        public let ok: Bool
        public let error: String?
        public let favoriteIdHash: String?
    }
    
    public struct Data: Decodable {
        public let addQuestionToNewFavorite: AddQuestionToFavorite
    }
    
    public let data: Data
}
