//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

struct CheckIntepretationStateWrapper: Decodable {
    public enum State: String {
        case pending = "PENDING"
        case started = "STARTED"
        case success = "SUCCESS"
        case undefined = ""
    }
    
    enum Key: String, CodingKey {
        case state
    }
    
    let state: State
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let value = try container.decode(String.self, forKey: .state)
        state = State(rawValue: value) ?? .undefined
    }
}
