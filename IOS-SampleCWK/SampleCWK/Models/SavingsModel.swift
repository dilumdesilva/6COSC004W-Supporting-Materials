//
//  CompoundSavings.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import Foundation

class Savings {
    var presentValue, interest, numberOfCompoundsPerYear, paymentValue, futureValue, numOfYears : Double?
    var isBeginning : Bool
    
    init() {
        presentValue = nil
        interest = nil
        numberOfCompoundsPerYear = 12.0
        isBeginning = false
        paymentValue = nil
        futureValue = nil
        numOfYears = nil
    }
    
    func canCalculate() -> Bool {
        var nonNilCount = 0
        if (self.presentValue != nil) { nonNilCount += 1 }
        if (self.interest != nil) { nonNilCount += 1 }
        if (self.paymentValue != nil) { nonNilCount += 1 }
        if (self.futureValue != nil) { nonNilCount += 1 }
        if (self.numOfYears != nil) { nonNilCount += 1 }
        
        return nonNilCount == 4;
    }
    
    func calculateMissingValue() -> (Double, String) {
        
        // Calculating Present Value
        if (self.presentValue == nil) {
            var calculatedPresentValue: Double = 0.0
            
            if let interest = self.interest, let numberOfCompoundsPerYear = self.numberOfCompoundsPerYear, let futureValue = self.futureValue, let numOfYears = self.numOfYears, let paymentValue = self.paymentValue {
                let i = interest / 100
                
                if (self.isBeginning) {
                    // If payment is made in the beggining
                    calculatedPresentValue = (futureValue - (paymentValue * (pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear)) * (1 + i / numberOfCompoundsPerYear)) / pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears)
                } else {
                    // If payment is made in the end
                    calculatedPresentValue = (futureValue - (paymentValue * (pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear))) / pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears)
                }
            }
            return (calculatedPresentValue.toFixed(2), "presentValue")
        }
        
        // Calculating interest
        if (self.interest == nil) {
            let calculatedInterest: Double = 0.0
            return (calculatedInterest.toFixed(2), "interest")
        }
        
        // Calculating paymentValue
        if (self.paymentValue == nil) {
            var calculatedPaymentValue: Double = 0.0
            
            if let presentValue = self.presentValue, let interest = self.interest, let numberOfCompoundsPerYear = self.numberOfCompoundsPerYear, let numOfYears = self.numOfYears,  let futureValue = self.futureValue {
                let i = interest / 100
                
                if (self.isBeginning) {
                    // If payment is made in the beggining
                    calculatedPaymentValue = (futureValue - (presentValue * pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears))) / ((pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear)) / (1 + i / numberOfCompoundsPerYear)
                } else {
                    // If payment is made in the end
                    calculatedPaymentValue = (futureValue - (presentValue * pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears))) / ((pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear))
                }
            }
            return (calculatedPaymentValue.toFixed(2), "paymentValue")
        }
        
        // Calculating futureValue
        if (self.futureValue == nil) {
            var calculatedFutureValue: Double = 0.0
            
            if let paymentValue = self.paymentValue, let presentValue = self.presentValue, let interest = self.interest, let numberOfCompoundsPerYear = self.numberOfCompoundsPerYear, let numOfYears = self.numOfYears {
                let i = interest / 100
                
                if(self.isBeginning) {
                    // If payment is made in the beggining
                    calculatedFutureValue = presentValue * pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) + (paymentValue * (pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear)) * (1 + i / numberOfCompoundsPerYear)
                } else {
                    // If payment is made in the end
                    calculatedFutureValue = presentValue * pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) + (paymentValue * (pow((1 + i / numberOfCompoundsPerYear), numberOfCompoundsPerYear * numOfYears) - 1) / (i / numberOfCompoundsPerYear))
                }
            }
            return (calculatedFutureValue.toFixed(2), "futureValue")
        }
        
        // Calculating numOfYears
        if (self.numOfYears == nil) {
            var calculatedNumOfYears: Double = 0.0
            
            if let presentValue = self.presentValue, let interest = self.interest, let numberOfCompoundsPerYear = self.numberOfCompoundsPerYear, let futureValue = self.futureValue, let paymentValue = self.paymentValue {
                let i = interest / 100
                
                if(self.isBeginning) {
                    // If payment is made in the beggining
                    calculatedNumOfYears = ((log(futureValue + paymentValue + ((paymentValue * numberOfCompoundsPerYear) / i)) - log(presentValue + paymentValue + ((paymentValue * numberOfCompoundsPerYear) / i))) / (numberOfCompoundsPerYear * log(1 + (i / numberOfCompoundsPerYear))))
                } else {
                    // If payment is made in the end
                    calculatedNumOfYears = (log(futureValue + ((paymentValue*numberOfCompoundsPerYear)/i)) - log(((i*presentValue) + (paymentValue*numberOfCompoundsPerYear)) / i)) / (numberOfCompoundsPerYear * log(1+(i/numberOfCompoundsPerYear)))
                }
            }
            return (calculatedNumOfYears.toFixed(2), "numOfYears")
        }
        
        return (0.0, "nil")
    }
    
    func saveDataAsUserDefaults() {
        let defaults = UserDefaults.standard
        
        defaults.set(self.presentValue, forKey: "Savings-presentValue")
        defaults.set(self.interest, forKey: "Savings-interest")
        defaults.set(self.isBeginning, forKey: "Savings-isBeginning")
        defaults.set(self.paymentValue, forKey: "Savings-paymentValue")
        defaults.set(self.futureValue, forKey: "Savings-futureValue")
        defaults.set(self.numOfYears, forKey: "Savings-numOfYears")
    }

    func loadDataFromDefults() {
        let defaults = UserDefaults.standard
        
        self.presentValue = defaults.object(forKey: "Savings-presentValue") as? Double ?? Double()
        self.interest = defaults.object(forKey: "Savings-interest") as? Double ?? Double()
        self.isBeginning = defaults.object(forKey: "Savings-isBeginning") as? Bool ?? Bool()
        self.paymentValue = defaults.object(forKey: "Savings-paymentValue") as? Double ?? Double()
        self.futureValue = defaults.object(forKey: "Savings-futureValue") as? Double ?? Double()
        self.numOfYears = defaults.object(forKey: "Savings-numOfYears") as? Double ?? Double()
    }
}
