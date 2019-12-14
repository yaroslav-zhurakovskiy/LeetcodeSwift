import Foundation

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
