//
//  User.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

final class User {
    var givenName: String
    var familyName: String
    var password: String
    var skills: [String]
    var email: String
    var id: Int

    init(givenName: String,
         familyName: String,
         password: String,
         skills: [String],
         email: String,
         id: Int) {
        self.givenName = givenName
        self.familyName = familyName
        self.password = password
        self.skills = skills
        self.email = email
        self.id = id
    }

    convenience init?(dictionary: [String: Any]) {
        guard let givenName = dictionary[User.givenNameKey] as? String,
            let familyName = dictionary[User.familyNameKey] as? String,
            let password = dictionary[User.passwordKey] as? String,
            let skillString = dictionary[User.skillsKey] as? String,
            let email = dictionary[User.emailKey] as? String,
            let id = dictionary[User.idKey] as? Int else {
                return nil
        }

        let skills: [String] = skillString.components(separatedBy: User.skillsSeparator)

        self.init(givenName: givenName, familyName: familyName, password: password, skills: skills, email: email, id: id)
    }
}
extension User {
    static var givenNameKey: String = "firstName"
    static var familyNameKey: String = "lastName"
    static var passwordKey: String = "password"
    static var skillsKey: String = "techSkills"
    static var emailKey: String = "email"
    static var idKey: String = "id"
    static var skillsSeparator: String = ", "
}

extension User : Equatable {

    public static func ==(lhs:User, rhs:User) -> Bool {
        return (lhs.givenName == rhs.givenName &&
                lhs.familyName == rhs.familyName &&
                lhs.email == rhs.email &&
                lhs.id == rhs.id &&
                lhs.password == rhs.password &&
                lhs.skills == rhs.skills)
    }
    
}

