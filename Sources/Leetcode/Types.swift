//
//  Types.swift
//  LeetcodeSwift
//
//  Created by Yaroslav Zhurakovskiy on 12.12.2019.
//  Copyright © 2019 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation

public enum LeetcodeResult<Value, E: Error> {
    case success(Value)
    case failure(E)
}

public struct VerificationInfo: Decodable {
    public let compile_error: String?
    public let elapsed_time: Int?
    public let full_compile_error: String?
    public let lang: String?
    public let memory: Int?
    public let memory_percentile: Int?
    public let pretty_lang: String?
    public let question_id: Int?
    public let run_success: Bool?
    public let runtime_percentile: String?
    public let state: String?
    public let status_code: Int?
    public let status_memory: String?
    public let status_msg: String?
    public let status_runtime: String?
    public let submission_id: String?
    public let task_finish_time: Int?
    public let total_correct: String?
    public let total_testcases: String?
}

public struct UserInfo: Decodable {
    public let username: String
    public let isCurrentUserPremium: Bool
}

 struct UserInfoData: Decodable {
    struct Data: Decodable {
        let user: UserInfo
    }
    let data: Data
}

public typealias GetUserInfoResult = LeetcodeResult<UserInfo, Error>

public typealias VerificationResult = LeetcodeResult<VerificationInfo, Error>

public struct Favorites: Decodable {
    public struct Question: Decodable {
        public let id: Int
        public let title: String
        public let title_slug: String
    }
    
    public struct Favorite: Decodable {
        public let id_hash: String
        public let name: String
        public let description: String
        public let questions: [Question]
        public let is_public_favorite: Bool
        public let view_count: Int
        public let creator: String
        public let current_user: String
        public let is_watched: Bool
    }
    
    public struct Favorites: Decodable {
        public let private_favorites: [Favorite]
        public let public_favorites: [Favorite]
        public let leetcode_favorites: [Favorite]
    }
    
    public let user_name: String
    public let favorites: Favorites
}

public typealias GetFavouritesResult = LeetcodeResult<Favorites, Error>

public struct SubmitInfo: Decodable {
    public let submission_id: Int
}

public typealias SubmitResult = LeetcodeResult<SubmitInfo, Error>

public typealias IDHash = String

public struct FavoriteQuestionID {
    public let favoriteIDHash: String
    public let questionID: Int
    
    public init(
        favoriteIDHash: String,
        questionID: Int
    ) {
        self.favoriteIDHash = favoriteIDHash
        self.questionID = questionID
    }
}

public struct SomeLeetcodeError: Error {
    public let localizedDescription: String
}

public struct HTTPURLResponseDecodingError: Error {
    public let data: Data
    public let body: String
    public let response: HTTPURLResponse
    public let decodingError: DecodingError
    
    init(
        data: Data,
        response: HTTPURLResponse,
        decodingError: DecodingError
    ) {
        self.data = data
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.decodingError = decodingError
    }
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

public struct GetProblemsResponse: Decodable {
    public struct Stat: Decodable {
        public let question_id: Int
        public let question__article__live: Bool?
        public let question__article__slug: String?
        public let question__title: String
        public let question__title_slug: String
        public let question__hide: Bool
        public let total_acs: Int
        
        public let total_submitted: Int
        public let frontend_question_id: Int
        public let is_new_question: Bool
    }
    
    public struct Difficulty: Decodable {
        public let level: Int
    }
    
    public struct StatStatusPair: Decodable {
        public let stat: Stat
        public let status: String?
        public let difficulty: Difficulty
        public let paid_only: Bool
        public let is_favor: Bool
        public let frequency: Int
        public let progress: Int
    }
    
    public let user_name: String
    public let num_solved: Int
    public let num_total: Int
    public let ac_easy: Int
    public let ac_medium: Int
    public let ac_hard: Int
    
    public let stat_status_pairs: [StatStatusPair]
    
    public let frequency_high: Int
    public let frequency_mid: Int
    public let category_slug: String
}

public struct ProgrammingLanguage: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public let value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

public extension ProgrammingLanguage {
    static let bash: ProgrammingLanguage = "bash"
    static let clang: ProgrammingLanguage = "c"
    static let cpp: ProgrammingLanguage = "cpp"
    static let csharp: ProgrammingLanguage = "csharp"
    static let golang: ProgrammingLanguage = "golang"
    static let java: ProgrammingLanguage = "java"
    static let javascript: ProgrammingLanguage = "javascript"
    static let kotlin: ProgrammingLanguage = "kotlin"
    static let mysql: ProgrammingLanguage = "mysql"
    static let php: ProgrammingLanguage = "php"
    static let python: ProgrammingLanguage = "python"
    static let python3: ProgrammingLanguage = "python3"
    static let ruby: ProgrammingLanguage = "ruby"
    static let rust: ProgrammingLanguage = "rust"
    static let scala: ProgrammingLanguage = "scala"
    static let swift: ProgrammingLanguage = "swift"
}

public struct Code {
    public let text: String
    public let lang: ProgrammingLanguage
    
    public init(text: String, lang: ProgrammingLanguage) {
        self.text = text
        self.lang = lang
    }
}

public struct Judge: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
       
    public let value: String
       
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

public extension Judge {
    static let small: Judge = "small"
    static let large: Judge = "large"
}

public struct Solution {
    public let question_id: Int
    public let input: TestCaseInput
    public let judge: Judge
    public let code: Code
    
    public init(
        for question_id: Int,
        code: Code,
        input: TestCaseInput,
        judge: Judge
    ) {
        self.question_id = question_id
        self.code = code
        self.input = input
        self.judge = judge
    }
}

extension Solution: Encodable {
    public enum SolutionKey: String, CodingKey {
        case question_id
        case judge_type
        case data_input
        case lang
        case typed_code
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SolutionKey.self)
        
        try container.encode(question_id, forKey: .question_id)
        try container.encode(input.rawValue, forKey: .data_input)
        try container.encode(code.text, forKey: .typed_code)
        try container.encode(code.lang.value, forKey: .lang)
        try container.encode(judge.value, forKey: .judge_type)
    }
}

public struct SubmissionDumpRecord: Decodable {
    public let id: Int
    public let lang: String
    public let time: String
    public let timestamp: Int
    public let status_display: String
    public let runtime: String
    public let url: String
    public let is_pending: String
    public let title: String
    public let memory: String
    public let code: String
    public let compare_result: String
}

public struct QuestionDetails: Decodable {
    public struct Stats: Decodable {
        public let totalAccepted: String
        public let totalSubmission: String
        public let totalAcceptedRaw: String
        public let totalSubmissionRaw: String
        public let acRate: String
    }
    
    public struct CodeDefinition: Decodable {
        public let value: String
        public let text: String
        public let defaultCode: String
    }
    
    public let content: String
    public let stats: String
    public let likes: Int
    public let dislikes: Int
    public let codeDefinition: String

    public let sampleTestCase: String
    public let enableRunCode: Bool
}
