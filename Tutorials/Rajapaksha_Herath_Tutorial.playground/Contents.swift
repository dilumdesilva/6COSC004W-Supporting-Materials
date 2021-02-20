//============WEEK 01====================//
import UIKit

var str = "Hello, playground"

let a = 2
let b = 3
let c = 4
print(c)

///swift basic

///Q1
///let number: Int = 10
///number = 0
///Q1 Answer: output was error because let is constant it cannot assign value while runtime

var variableNumber: Int = 42
variableNumber = 0
variableNumber = 1_000_000

///Q2
///var integer: Int = 100
///var decimal: Double = 12.5
///integer = decimal
///Q2 Answer : In here cannot assign double value to int value because swift is very strict about type. would this work with Javascript

var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

let circle: (x: Int, y: Int, radius: Int)
circle.x = 5
circle.y = 10
circle.radius = 20


let coordinates3D: (x: Int, y: Int, z: Int) = (2,3,1)
let x = coordinates3D.x
let y = coordinates3D.y
let z = coordinates3D.z
print(x, y ,z)

///Exercise with tuple
var averageTempToday: (month: Int, day: Int, year: Int, temperature: Double)
averageTempToday = (2, 4, 2021, 30.2)
let (_, day, _ , temperature) = averageTempToday
print(day, temperature)

///Inference exercise
let typeCheck = (1,2)
let value = typeCheck.0

///operators with mixes types

///let hourlyRate  = 19.5
///let hoursWorked = 10
///let totalCost   = hourlyRate * hoursWorked
///Q answer: Because binary operator can't apply with different types, To solve this  "let hoursWorked = 10.0" instead of let hoursWorked = 10.

//============WEEK 02====================//
let pi = 3.14159

///optional
var aa = 2
var aaOpt: Int?
///print(aaOpt)
/// aaOpt value is nil because no initial value for aaOpt
///let cc = aa * aaOpt

if aaOpt != nil {
    let c4 = a * aaOpt!
}else {
    print("value not assigned")
}

var name: String
aaOpt = 7

if let actualNumber = aaOpt {
    print("The number \(aaOpt!) has an integer value of \(actualNumber)")
} else {
    print("The number \(aaOpt!) has not been assigned a number")

}

var name2: String? = "Phil"
///var age: Int = nil
let distance: Float = 26.7
var middelName: String? = nil

///Practices with optional to test understanding

func divedelWhole(value: Int, divisor: Int) -> Int?{
    
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}



if let answer = divedelWhole(value: 20, divisor: 2) {
    print("It divides \(answer) times.")
} else {
    print("Not divisible")
}

if let answer = divedelWhole(value: 20, divisor: 3) {
    print("It divides \(answer) times.")
} else {
    print("Not divisible")
}
