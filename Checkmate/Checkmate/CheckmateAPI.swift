//
//  CheckmateAPI.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

struct CheckmateAPI {
    static let base: URL = URL(string: "http://skeventapp.herokuapp.com")!

    static var sessionConfig: URLSessionConfiguration {
        let config =  URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        ]
        return config
    }
}

extension CheckmateAPI {
    enum Method {
        case register
        case login

        var pathComponent: String {
            switch self {
            case .register:
                return "register.json"
            case .login:
                return "login.json"
            }
        }

        var url: URL {
            return base.appendingPathComponent(pathComponent)
        }
    }
}

