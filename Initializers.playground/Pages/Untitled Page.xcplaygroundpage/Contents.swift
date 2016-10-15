//: Classes sometimes receive a no-argument initializer for free
class Clown {
    // implied
//    init() {}
}
Clown()

//: Classes whose properties all have a default value keep their free no-argument initializer

class Account {
    var balance: Int = 0
}
Account()

//: Properties with optional types have an implied default value of nil so classes with them can keep their no-argument initializer

class Pocket {
    var contents: String?
}
Account()
class Person {
    var pocket: Pocket = Pocket()
    var spouse: Person?
}

Person()