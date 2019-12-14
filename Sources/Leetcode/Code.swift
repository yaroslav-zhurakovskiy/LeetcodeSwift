//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct Code {
    public let text: String
    public let lang: ProgrammingLanguage
    
    public init(text: String, lang: ProgrammingLanguage) {
        self.text = text
        self.lang = lang
    }
}
