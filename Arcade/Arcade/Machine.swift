//
//  Machine.swift
//  Arcade
//
//  Created by TJ Usiyan on 2016/13/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

class Machine {
    var credits: Int = 0
    var playing: Bool = false

    func addCredit() {
        credits += 1
    }

    func startGame() -> Bool {
        if credits >= 2 {
            credits -= 2
            playing = true
        }

        return playing
    }



}
