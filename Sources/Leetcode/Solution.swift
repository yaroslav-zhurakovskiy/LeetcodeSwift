import Foundation


public struct Solution {
    public let problemID: ProblemID
    public let input: TestCaseInput
    public let judge: Judge
    public let code: Code
    
    public init(
        forProblemWithID problemID: ProblemID,
        code: Code,
        input: TestCaseInput,
        judge: Judge
    ) {
        self.problemID = problemID
        self.code = code
        self.input = input
        self.judge = judge
    }
}

extension Solution: Encodable {
    private enum SolutionKey: String, CodingKey {
        case question_id
        case judge_type
        case data_input
        case lang
        case typed_code
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SolutionKey.self)
        
        try container.encode(problemID.questionID, forKey: .question_id)
        try container.encode(input.rawValue, forKey: .data_input)
        try container.encode(code.text, forKey: .typed_code)
        try container.encode(code.lang.value, forKey: .lang)
        try container.encode(judge.value, forKey: .judge_type)
    }
}
