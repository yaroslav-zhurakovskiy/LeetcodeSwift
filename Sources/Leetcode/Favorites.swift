//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct Favorites: Decodable {
    public struct Question: Decodable {
        public let id: Int
        public let title: String
        public let title_slug: String
    }
    
    public struct Favorite: Decodable {
        public let id_hash: String
        public let name: String
        public let description: String
        public let questions: [Question]
        public let is_public_favorite: Bool
        public let view_count: Int
        public let creator: String
        public let current_user: String
        public let is_watched: Bool
    }
    
    public struct Favorites: Decodable {
        public let private_favorites: [Favorite]
        public let public_favorites: [Favorite]
        public let leetcode_favorites: [Favorite]
    }
    
    public let user_name: String
    public let favorites: Favorites
}
