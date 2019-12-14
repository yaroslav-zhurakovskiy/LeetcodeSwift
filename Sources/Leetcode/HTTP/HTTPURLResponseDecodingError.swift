//
//  File 2.swift
//  
//
//  Created by Yaroslav Zhurakovskiy on 14.12.2019.
//

import Foundation

public struct HTTPURLResponseDecodingError: Error {
    public let data: Data
    public let body: String
    public let response: HTTPURLResponse
    public let decodingError: DecodingError
    
    init(
        data: Data,
        response: HTTPURLResponse,
        decodingError: DecodingError
    ) {
        self.data = data
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.decodingError = decodingError
    }
}
