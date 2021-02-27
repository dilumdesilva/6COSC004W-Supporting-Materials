//
//  Loan.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import Foundation

class Loan : CalculationHelper {
    var loanAmount, interest, payment, numOfPayments : Double?
    var numberOfPaymentsPerYear : Double
    
    init() {
        loanAmount = nil
        interest = nil
        payment = nil
        numOfPayments = nil
        numberOfPaymentsPerYear = 12
    }
    
    func canCalculate() -> Bool {
        var nonNilCount = 0
        if (self.loanAmount != nil) { nonNilCount += 1 }
        if (self.interest != nil) { nonNilCount += 1 }
        if (self.payment != nil) { nonNilCount += 1 }
        if (self.numOfPayments != nil) { nonNilCount += 1 }
        
        return nonNilCount == 3;
    }
    
    func calculateMissingValue() -> (Double, String) {
        // Calculating loan Amount
        if (self.loanAmount == nil) {
            var calculatedLoanAmount: Double = 0.0
            if let interest = self.interest, let payment = self.payment, let numOfPayments = self.numOfPayments {
                let i = (interest / 100) / 12
                let numOfYears = numOfPayments / numberOfPaymentsPerYear
                let n = numOfYears * 12
                calculatedLoanAmount = payment / (( i * pow(1 + i, n)) / (pow(1 + i, n) - 1))
            }
            return (calculatedLoanAmount.toFixed(2), "loanAmount")
        }
        
        // Calculating interest
        if (self.interest == nil) {
            var calculatedInterest: Double = 0.0
            if let loanAmount = self.loanAmount, let payment = self.payment, let numOfPayments = self.numOfPayments {
                calculatedInterest = self.missingInterestRate(pa: loanAmount, payment: payment, terms: numOfPayments)
            }
                
            return (calculatedInterest.toFixed(2), "interest")
        }
        
        // Calculating payment
        if (self.payment == nil) {
            var calculatedPayment: Double = 0.0
            if let loanAmount = self.loanAmount, let interest = self.interest, let numOfPayments = self.numOfPayments {
                let i = (interest / 100) / 12
                let numOfYears = numOfPayments / numberOfPaymentsPerYear
                let n = numOfYears * 12
                calculatedPayment = loanAmount * ( i * pow(1 + i, n)) / (pow(1 + i, n) - 1)
            }
            return (calculatedPayment.toFixed(2), "payment")
        }

        // Calculating num Of Payments
        if (self.numOfPayments == nil) {
            var calculatedNumOfPayments: Double = 0.0
            if let loanAmount = self.loanAmount, let payment = self.payment, let interest = self.interest {
                let i = (interest / 100) / 12
                let calculatedNumOfMonths = log((payment / i) / ((payment / i) - loanAmount)) / log(1 + i)
                let calculatedNumOfYears = calculatedNumOfMonths / 12
                calculatedNumOfPayments = calculatedNumOfYears * numberOfPaymentsPerYear
            }
            return (calculatedNumOfPayments.toFixed(0), "numOfPayments")
        }
        return (0.0, "nil")
    }
    
    func saveDataToStorage() {
        let defaults = UserDefaults.standard

        defaults.set(self.loanAmount, forKey: Keys.Loan.LOAN_AMOUNT)
        defaults.set(self.interest, forKey: "Loan-interest")
        defaults.set(self.payment, forKey: "Loan-payment")
        defaults.set(self.numOfPayments, forKey: "Loan-numOfPayments")
    }

    func loadDataFromStorage() {
        let defaults = UserDefaults.standard
        
        self.loanAmount = defaults.object(forKey: Keys.Loan.LOAN_AMOUNT) as? Double ?? Double()
        self.interest = defaults.object(forKey: "Loan-interest") as? Double ?? Double()
        self.payment = defaults.object(forKey: "Loan-payment") as? Double ?? Double()
        self.numOfPayments = defaults.object(forKey: "Loan-numOfPayments") as? Double ?? Double()
    }
}

