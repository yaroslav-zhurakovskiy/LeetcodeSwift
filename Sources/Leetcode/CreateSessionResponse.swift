//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct CreateSessionResponse: Decodable {
    public let sessions: [Session]
    public let is_full: Bool
}
