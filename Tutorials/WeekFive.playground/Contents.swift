import UIKit

class Vehicle {
    var yearOfRegistration: String?
    var yearOfManufacture: String?
}


var newVehicle = Vehicle()

//number plate, car obj, price
let vehicleData: [Any] = ["wp-0001", newVehicle, 3600000.0]

let numberPlate =  vehicleData[0]
let price = vehicleData[2]

let carRegistrationData = vehicleData[1] as! Vehicle

carRegistrationData.yearOfManufacture = "2019"
carRegistrationData.yearOfRegistration = "Not registered"
print(carRegistrationData.yearOfManufacture ?? "")


// ------------------ User Defualts ---------------------

let defaults = UserDefaults.standard

defaults.setValue(CGFloat.pi, forKey: "Pi")
defaults.setValue("Dollars", forKey: "$")
defaults.setValue("Sri Lankan Rupees", forKey: "LKR")
defaults.setValue(30, forKey: "ExchangeRate")

var currentBalance = 10000
var withdrawAmount = 2000

let userAccountBalance = currentBalance - (withdrawAmount + defaults.integer(forKey: "ExchangeRate"))
print("userAccountBalance: \(userAccountBalance) \(defaults.string(forKey: "LKR") ?? "LKR")")

if !defaults.synchronize() {print("Default sync failed")}

var someString = "Hello World"
let length = (someString as NSString).length
print("length: \(length)")


//Measurement

// Temperature caluations
let temp = Measurement(value: 90, unit: UnitTemperature.fahrenheit)
print("User input of temperature: \(temp)")

let tempInCelcious = temp.converted(to: UnitTemperature.celsius)
print("User input of temperature: \(tempInCelcious)")

let speed = Measurement(value: 90, unit: UnitSpeed.kilometersPerHour)
