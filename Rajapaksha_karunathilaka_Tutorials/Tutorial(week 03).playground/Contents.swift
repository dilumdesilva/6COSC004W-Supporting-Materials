//============WEEK 02====================//
import UIKit

/// MARK: Exercises Q1
struct Rectangle {
    
    var width: Float
    var height: Float
    
    var area: Float {
        get {
            return width * height
        }
    }
}

let test_rectangle = Rectangle(width: 20, height: 25)

print("Rectangle area:  \(test_rectangle.area)")


/// MARK: Exercises Q2 and Q3
struct Point {
    var x = 0.0 , y = 0.0
}

struct Circle {
    
    var center = Point()
    var radius: Float
   
    var circumference: Float {
        return 2 * Float.pi * radius
    }
    
    var area: Float {
        (Float.pi) * pow(radius, 2)
    }
}

let test_circle = Circle(center: Point(x: 0, y: 0), radius: 5)

print("Circle circumference:  \(test_circle.circumference)")
print("Circle area:  \(test_circle.area)")

/// MARK: Exercises Q4 and Q5
struct Time {
    
    var miliSeconds: Double
    
    var seconds: Double {
        get {
            return miliSeconds / 1000
        }
    }
    
    var minutes: Double {
        get {
            return miliSeconds / 1000 / 60
        }
    }
    
    var hours: Double {
        get {
            return miliSeconds / 1000 /  60 / 60
        }
    }
}

var time = Time(miliSeconds: 1765499.0)

print(String(format: "miliseconds: %.2f", time.miliSeconds))
print(String(format: "seconds: %.2f", time.seconds))
print(String(format: "minutes: %.2f", time.minutes))
print(String(format: "hours: %.2f", time.hours))

