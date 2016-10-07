//
//  RegistrationRequest.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

enum Registration /* namespace */ {
    struct Request {
        var givenName: String
        var familyName: String
        var password: String
        var skills: [String]
        var email: String

        init(givenName: String,
             familyName: String,
             password: String,
             skills: [String],
             email: String) {
            self.givenName = givenName
            self.familyName = familyName
            self.password = password
            self.skills = skills
            self.email = email
        }
    }
}

extension Registration.Request {
    var  jsonObject: [String: Any] {
        return [
            User.givenNameKey : givenName,
            User.familyNameKey : familyName,
            User.passwordKey : password,
            User.skillsKey : skills.joined(separator: User.skillsSeparator),
            User.emailKey : email
        ]
    }

    func jsonData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: jsonObject, options: [])
    }
}

extension Registration {
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
                    fatalError("Incompatible type in registration response")
                } catch {
                    fatalError("error converting registration response: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension Registration.Response.Result : Equatable {
    public static func ==(lhs:Registration.Response.Result, rhs:Registration.Response.Result) -> Bool {
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

extension Registration.Response.Error : Equatable {

    public static func ==(lhs:Registration.Response.Error, rhs:Registration.Response.Error) -> Bool {
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

