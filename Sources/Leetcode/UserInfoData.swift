//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct UserInfo: Decodable {
    public let username: String
    public let isCurrentUserPremium: Bool
}
