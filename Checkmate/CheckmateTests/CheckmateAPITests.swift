//
//  CheckmateAPITests.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Checkmate

class CheckmateAPITests: XCTestCase {
    func testSuccessfulRegistrationResponse() {
        let jsonData = ("{\"errorMessage\":null,\"user\":{\"id\":35,\"email\":\"by@anyone.com\",\"password\":\"it\'snotunusual\",\"firstName\":\"tom\",\"lastName\":\"jones\",\"techSkills\":\"being loved\"}}").data(using: .utf8)!

        let response = Registration.Response.Result(data: jsonData)

        let expectedUser = User(givenName: "tom", familyName: "jones", password: "it\'snotunusual", skills: ["being loved"], email: "by@anyone.com", id: 35)
        let expected: Registration.Response.Result = .success(expectedUser)

        XCTAssertEqual(response, expected)
    }

    func testSuccessfulLoginResponse() {
        let jsonData = ("{\"errorMessage\":null,\"user\":{\"id\":35,\"email\":\"by@anyone.com\",\"password\":\"it\'snotunusual\",\"firstName\":\"tom\",\"lastName\":\"jones\",\"techSkills\":\"being loved\"}}").data(using: .utf8)!

        let response = Login.Response.Result(data: jsonData)

        let expectedUser = User(givenName: "tom", familyName: "jones", password: "it\'snotunusual", skills: ["being loved"], email: "by@anyone.com", id: 35)
        let expected: Login.Response.Result = .success(expectedUser)

        XCTAssertEqual(response, expected)
    }
}
