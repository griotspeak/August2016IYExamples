//
//  JSONTools.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

extension JSONSerialization {
    enum CastingError : Swift.Error {
        case incompatibleType
    }

    static func jsonObject<T>(with data: Data, options: JSONSerialization.ReadingOptions) throws -> T {
        let anyResult: Any = try jsonObject(with: data, options: options)
        if let result = anyResult as? T {
            return result
        } else {
            throw CastingError.incompatibleType
        }
    }
}

