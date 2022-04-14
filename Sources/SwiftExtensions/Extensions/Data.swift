//
//  Data.swift
//  
//
//  Created by Hamad Ali on 14/04/2022.
//

import Foundation

public extension Data {

    func string(encoding: String.Encoding) -> String? {
        String(data: self, encoding: encoding)
    }

    func json(options: JSONSerialization.ReadingOptions = []) throws -> Any {
        try JSONSerialization.jsonObject(with: self, options: options)
    }
}
