//: [Previous](@previous)

/*:
 # Computed Properties
 */

import Foundation

/*:
 `tupleRepresentation`  is a computed property. No space within the struct is needed to create and return the value and we can convert a provided value into our representation to store.
 */

struct Point {
    var x: Double
    var y: Double

    var tupleRepresentation: (x: Double, y: Double) {
        get {
            return (x: x, y: y)
        }
        set(input) {
            x = input.x
            y = input.y
        }

        /*
         // alternatively, we can choose not to explicitly name the incoming value. The implicit name is `newValue`
         set {
            x = newValue.x
            y = newValue.y
        }*/
    }
}

/*:
 `distanceFromOrigin` is a computed property. No space within the struct is needed to create and return the value. Since there is no need to set this value, we elide the get keyword and extra braces.

 */

extension Point {
    var distanceFromOrigin: Double {
        return sqrt((x * x) + (y * y)) // a^2 + b^2 = c^2
    }
}

//: [Next](@next)
