//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct LeetcodeHTTPError: Error {
    public let responseBody: Data
    public let response: HTTPURLResponse
}

