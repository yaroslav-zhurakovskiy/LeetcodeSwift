//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct Session: Decodable {
    public let id: Int
    public let is_active: Bool
    public let total_acs: Int
    public let name: String
    public let ac_questions: Int
    public let submitted_questions: Int
    public let total_submitted: Int
}
