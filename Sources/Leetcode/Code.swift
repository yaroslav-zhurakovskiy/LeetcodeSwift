import Foundation

public struct Code {
    public let text: String
    public let lang: ProgrammingLanguage
    
    public init(text: String, lang: ProgrammingLanguage) {
        self.text = text
        self.lang = lang
    }
}
