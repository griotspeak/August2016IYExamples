//: [Previous](@previous)

/*:
 # <#Instance Methods#>
 */

import Foundation

struct Point {
    var x: Double
    var y: Double

    func distance(to other: Point) -> Double {
        let xComponent = other.x - x
        let yComponent = other.y - y
        return sqrt((xComponent * xComponent) + (yComponent * yComponent)) // a^2 + b^2 = c^2
    }
}

let a = Point(x: -6, y: 8)
let b = Point(x: 2, y: 2)
a.distance(to: b)

//: [Next](@next)
