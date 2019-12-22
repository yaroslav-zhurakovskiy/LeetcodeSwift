//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

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
