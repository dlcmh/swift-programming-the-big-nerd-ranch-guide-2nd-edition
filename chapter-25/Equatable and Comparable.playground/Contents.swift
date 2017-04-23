import Cocoa

//struct Point: Equatable, Comparable { // Equatable conformance declaration not needed as
                                        // Comparable inherits from Equatable
struct Point: Comparable {
    let x: Int
    let y: Int
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
    }
}

// Testing Equatable
let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
let abNotEqual = (a != b) // != operator obtained for free

// Testing Comparable
let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)
let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d) // <= operator obtained for free
let cGreaterThanD = (c > d) // > operator obtained for free
let cGreaterThanEqualD = (c >= d) // >= operator obtained for free

/*
 * Platinum Challenge - Comparison of `Point`s done using the Euclidean distance
 * of each point instead of comparing the x & y values independently.
 */
struct EuclideanPoint: Comparable {
    let x: Int
    let y: Int
    
    static func ==(lhs: EuclideanPoint, rhs: EuclideanPoint) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func <(lhs: EuclideanPoint, rhs: EuclideanPoint) -> Bool {
        func euclideanDistanceFromOrigin(point: EuclideanPoint) -> Double {
            let distanceX = Double(point.x - 0)
            let distanceY = Double(point.y - 0)
            return sqrt(pow(distanceX, 2) + pow(distanceY, 2))
        }
        return euclideanDistanceFromOrigin(point: lhs) < euclideanDistanceFromOrigin(point: rhs)
    }
}

let e = EuclideanPoint(x: 2, y: 6)
let f = EuclideanPoint(x: 3, y: 1)
let efEqual = (e == f)
let eLessThanF = (e < f)

let eLessThanEqualF = (e <= f) // <= operator obtained for free
let eGreaterThanF = (e > f) // > operator obtained for free
let eGreaterThanEqualF = (e >= f) // >= operator obtained for free
