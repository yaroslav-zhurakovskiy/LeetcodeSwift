import Foundation

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
