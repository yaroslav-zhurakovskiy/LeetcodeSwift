//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

struct UserInfoDataWrapper: Decodable {
    struct Data: Decodable {
        let user: UserInfo
    }
    let data: Data
}

struct AddQuestionToFavoriteDataWrapper: Decodable {
    struct AddQuestionToFavorite: Decodable {
       public let ok: Bool
       public let error: String?
    }
    
    public struct Data: Decodable {
        public let addQuestionToFavorite: AddQuestionToFavorite
    }
    
    public let data: Data
}

struct AddQuestionToNewFavoriteDataWrapper: Decodable {
    struct AddQuestionToFavorite: Decodable {
        public let ok: Bool
        public let error: String?
        public let favoriteIdHash: String?
    }
    
    struct Data: Decodable {
        let addQuestionToNewFavorite: AddQuestionToFavorite
    }
    
    let data: Data
}

struct CheckIntepretationStateWrapper: Decodable {
    public enum State: String {
        case pending = "PENDING"
        case started = "STARTED"
        case success = "SUCCESS"
        case undefined = ""
    }
    
    private enum Key: String, CodingKey {
        case state
    }
    
    let state: State
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        guard container.contains(.state) else {
            state = .undefined
            return
        }
        
        let value = try container.decode(String.self, forKey: .state)
        state = State(rawValue: value) ?? .undefined
        
    }
}

struct SubmissionDumpWrapper: Decodable {
    let submissions_dump: [SubmissionDumpRecord]
}

struct QuestionDetailsWrapper: Decodable {
    struct Data: Decodable {
        let question: QuestionDetails
    }
    
    let data: Data
}
