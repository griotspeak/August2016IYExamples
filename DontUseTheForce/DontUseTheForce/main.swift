//
//  main.swift
//  DontUseTheForce
//
//  Created by TJ Usiyan on 2016/27/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

func doIt(input: String?) {
    print("\(input) is optional")

    if input != nil {
        let string: String = input!
        print("\(string) is not optional anymore")
    }

    if let string = input {
        print("\(string) is not optional anymore here either")
    } else {
        print("input was nil")
    }

    print("Whoa. That was close but \(input!) is not optional here either!")

}



let optionalString1: String? = "Hi"
let optionalString2: String? = nil

doIt(input: optionalString1)
print("Why not use the force?\n\n\n")
doIt(input: optionalString2)

