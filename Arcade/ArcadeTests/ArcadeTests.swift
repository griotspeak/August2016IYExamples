//
//  ArcadeTests.swift
//  ArcadeTests
//
//  Created by TJ Usiyan on 2016/13/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Arcade

class ArcadeTests: XCTestCase {
    func testAddCredit() {
        let machine = Machine()
        XCTAssertEqual(machine.credits, 0)
        machine.addCredit()
        XCTAssertEqual(machine.credits, 1)
    }

    func testStartGameWithEnoughCredits() {
        let machine = Machine()
        machine.addCredit()
        machine.addCredit()
        XCTAssertEqual(machine.playing, false)
        XCTAssertEqual(machine.credits, 2)
        XCTAssertTrue(machine.startGame())
        XCTAssertEqual(machine.playing, true)
        XCTAssertEqual(machine.credits, 0)

    }

    func testStartGameWithMoreThanEnoughCredits() {
        let machine = Machine()
        machine.addCredit()
        machine.addCredit()
        machine.addCredit()
        XCTAssertEqual(machine.playing, false)
        XCTAssertEqual(machine.credits, 3)
        XCTAssertTrue(machine.startGame())
        XCTAssertEqual(machine.playing, true)
        XCTAssertEqual(machine.credits, 1)

    }

    func testStartGameWithoutEnoughCredits() {
        let machine = Machine()
        machine.addCredit()
        XCTAssertEqual(machine.playing, false)
        XCTAssertFalse(machine.startGame())
        XCTAssertEqual(machine.playing, false)

    }

}
