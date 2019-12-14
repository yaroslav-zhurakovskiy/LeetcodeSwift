//
//  Types.swift
//  LeetcodeSwift
//
//  Created by Yaroslav Zhurakovskiy on 12.12.2019.
//  Copyright © 2019 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

struct UserInfoData: Decodable {
    struct Data: Decodable {
        let user: UserInfo
    }
    let data: Data
}

public typealias GetUserInfoResult = LeetcodeResult<UserInfo, Error>

public typealias VerificationResult = LeetcodeResult<VerificationInfo, Error>


public typealias GetFavouritesResult = LeetcodeResult<Favorites, Error>

public struct SubmitInfo: Decodable {
    public let submission_id: Int
}

public typealias SubmitResult = LeetcodeResult<SubmitInfo, Error>

public typealias IDHash = String


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
