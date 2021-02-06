import UIKit

var str = "Hello, playground"

print(str)

var student = "dilum"
let id: Int = 1234
var enrolledClass: String = "iOS"

let studentDetails =  "Name: \(student), id: \(id)"

print(studentDetails)

var variableNumber: Int = 42
variableNumber = 0
variableNumber = 1_000_000

let myself="""
I am a software engineer
who's working for circle.life
id: \(id)

"""
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

let coordinates: (Double, Double) = (2, 3)


let x: Double = coordinates.0

let coordinates3D: (x: Int, y: Int, z: Int) = (2, 3, 1)

let (a,b,_) = coordinates3D


let stuIDList =  [1,2,3,4]
var stuID = 0

for stuID in stuIDList {
    if stuID == 2{
        print
    }
}



