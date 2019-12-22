//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct Code {
    public let text: String
    public let lang: ProgrammingLanguage
    
    public init(text: String, lang: ProgrammingLanguage) {
        self.text = text
        self.lang = lang
    }
}
