//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct ProgrammingLanguage: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public let value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
    
    public init(value: String) {
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
