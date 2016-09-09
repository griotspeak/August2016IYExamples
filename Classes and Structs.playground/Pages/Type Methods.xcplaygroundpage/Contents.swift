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

    func say(text: String) {
        print(text)
        print("my name is \(name). My type is \(type(of: self))")
    }

    func changePhone(to newNumber: PhoneNumber) -> Bool {
        if Person.isValid(newNumber) {
            phone = newNumber
            return true
        } else {
            return false
        }
    }

    static func isValid(_ phoneNumber: PhoneNumber) -> Bool {
        print(type(of:self))
        return phoneNumber.characters.count == 8
    }
}

let makeba = Person()

Person.isValid("555-134")

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
