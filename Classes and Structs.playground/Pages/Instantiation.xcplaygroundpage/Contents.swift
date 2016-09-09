//: [Previous](@previous)

/*:
 # Instantiation
 */

struct Point {
    var x: Double
    var y: Double
}

let pointA = Point(x: 51.30, y: 0.08)
var pointB = Point(x: 0, y: 0)
pointB.x = 48.51
pointB.y = 2.21

print("Point A has an x value of \(pointA.x) and a y value of \(pointA.y)")
print("Point B has an x value of \(pointB.x) and a y value of \(pointB.y)")

// Note: Floating point numbers a weird. See?
print(pointA)
print(pointB)

//: [Next](@next)
