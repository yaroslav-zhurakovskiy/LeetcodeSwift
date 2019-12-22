//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

public struct ProblemID {
    public let questionID: Int
    public let slug: String
    
    public init(questionID: Int, slug: String) {
        self.questionID = questionID
        self.slug = slug
    }
}
