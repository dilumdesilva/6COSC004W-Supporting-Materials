import UIKit


//-----------------------OPTIONALS RELATED EXERCISES-----------------------------------

let userInput = "90"

var convertedUserInput = Int(userInput)

//print("convertedUserInput: \(convertedUserInput!)")

func increment(input number: Int) -> Int{
    guard number > 100 else {
        return number
    }
    return number*5
}


var incrementedInput =  increment(input: convertedUserInput!)
print(incrementedInput)


if let unwrappedInput = convertedUserInput{
    print("unwrappedInput: \(unwrappedInput)")
}else{
    print("convertedUserInput is not unwrapped: \(convertedUserInput)")
}


var someInput: Int? = 10
let defaultInput = 0

var input = someInput ?? defaultInput
print("input when someInput is 10: \(input)")

someInput = nil
var input2 = someInput ?? defaultInput
print("input when someInput is nil: \(input2)")



//-----------------------ARRAYS RELATED EXERCISES-----------------------------------

var students = ["Sunil", "Kamal", "Sarala", "Dilum"]

students.count
students.isEmpty

for student in students {
    print(student)
}

for (index, student) in students.enumerated() {
    print(student)
}

var firstStudent =  students[0]

let firstFewStudents = students[1...3]
print("first few students: \(firstFewStudents)")


func registerNewStudentBy(name studentName: String) {
    students.insert(studentName, at: students.count)
}

func removeStudentBy(ID studentID: Int) {
    students.remove(at: studentID)
}

func updateStudentWith(ID studentID: Int, name studentName: String) {
    students[studentID] = studentName
}

students.swapAt(1, 2)
students.sort()


//-----------------------DICTIOARY RELATED EXERCISES-----------------------------------

var users = ["Dilum": "123@abc",
             "Kasun": "1234@123"]
print(users["Dilum"] ?? "User not found")

var newUsers = [1: ["Dilum","123@abc1"],
                2: ["Kamal","123@abc2"],
                3: ["Sunil","123@abc3"]]

for (userID, userData) in newUsers {
    print("user ID: \(userID) --> username: \(userData[0]) --> password: \(userData[1])")
}

//-----------------------RANGE RELATED EXERCISES-----------------------------------


let someArray =  1..<20
print(someArray.upperBound)

let subArrayOneToTen = someArray[1...10]
for value in subArrayOneToTen {
    print(value)
}

//-----------------------CLASSES STRUCTS AND ENUMS RELATED EXERCISES-----------------------------------

struct Rectangle {
    var length: Double
    var bredth: Double
    init() {
        length = 5.0
        bredth = 2.0
    }
}

var area = Rectangle()
print(area.length*area.bredth)
