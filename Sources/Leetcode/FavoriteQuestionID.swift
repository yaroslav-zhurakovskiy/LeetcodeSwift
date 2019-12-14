//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

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
