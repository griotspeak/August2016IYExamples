//: [Previous](@previous)

/*:
 # Type Methods
 */


/*:
 static methods cannot be overriden by subclasses. They can be declared on enums, structs, and classes.
 */

typealias PhoneNumber = String

class Person {
    var name: String = "Makeba Doe"
    var phone: PhoneNumber = "555-1234"

    static func isValid(_ phoneNumber: PhoneNumber) -> Bool {
        // figure it out
        return true
    }
}

/*:
 class methods cannot be overriden by subclasses. They can only be declared on classes.
 */

class Character {
    class func canDance() -> Bool {
        // figure it out
        return true
    }
}


//: [Next](@next)
