//: [Previous](@previous)

/*:
 # Lazy Properties
 */

import CoreGraphics

struct Image {}

class Person {
    var name: String = "Makeba Doe"
    var phone: String = "555-1234"

    // properties declared with `let` (constants) must have a value before initialization is complete. This means that lazy variable cannot be declared with `let`
    lazy var hiResPortrait: Image = {
        // some expensive (timewise or computationally) bit of work
        return Image()
    }()
}

//: [Next](@next)
