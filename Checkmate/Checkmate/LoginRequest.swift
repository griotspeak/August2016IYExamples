//
//  LoginRequest.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

enum Login /* namespace */ {
    struct Request {
        var email: String
        var password: String

        init(email: String,
             password: String) {
            self.email = email
            self.password = password
        }
    }
}

extension Login.Request {
    var  jsonObject: [String: Any] {
        return [
            User.emailKey : email,
            User.passwordKey : password
        ]
    }

    func jsonData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: jsonObject, options: [])
    }
}

extension Login {
    enum Response /* namespace */ {
        enum Error : Swift.Error {
            case invalidData([String: Any])
            case unexpected
        }

        enum Result {
            case success(User)
            case failure(Error)

            init(data: Data) {
                do {
                    let objects: [String: Any] = try JSONSerialization.jsonObject(with: data, options: [])
                    if let userDict = objects["user"] as? [String: Any],
                        let user = User(dictionary: userDict) {
                        self = .success(user)
                    } else {
                        self = .failure(.invalidData(objects))
                    }
                } catch JSONSerialization.CastingError.incompatibleType {
                    fatalError("Incompatible type in login response")
                } catch {
                    fatalError("error converting login response: \(error.localizedDescription)")
                }
            }
        }
    }
}


extension Login.Response.Result : Equatable {
    public static func ==(lhs:Login.Response.Result, rhs:Login.Response.Result) -> Bool {
        switch (lhs, rhs) {
        case let (.success(lhs), .success(rhs)):
            return lhs == rhs
        case let (.failure(lhs), .failure(rhs)):
            return lhs == rhs
        case (.success, .failure), (.failure, .success):
            return false
        }
    }
}

extension Login.Response.Error : Equatable {

    public static func ==(lhs:Login.Response.Error, rhs:Login.Response.Error) -> Bool {
        switch (lhs, rhs) {
        case (.invalidData, .invalidData): /* TODO: Should test dictionary… someday 2016-10-05 */
            return true
        case (.unexpected, .unexpected):
            return true
        case (.invalidData, .unexpected), (.unexpected, .invalidData):
            return false
        }
    }

}
