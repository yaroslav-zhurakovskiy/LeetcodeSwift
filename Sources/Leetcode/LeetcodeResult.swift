//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public enum LeetcodeResult<Value, E: Error> {
    case success(Value)
    case failure(E)
}
