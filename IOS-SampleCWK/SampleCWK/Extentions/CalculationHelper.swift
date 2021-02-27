//
//  CalculationHelper.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import Foundation
import UIKit

protocol CalculationHelper {
    func missingInterestRate(pa: Double, payment: Double, terms: Double) -> Double
}

extension CalculationHelper {
    func missingInterestRate(pa: Double, payment: Double, terms: Double) -> Double {
        var x = 1 + (((payment*terms/pa) - 1) / 12)
        let FINANCIAL_PRECISION = Double(0.000001) // 1e-6
        
        func F(_ x: Double) -> Double { // f(x)
            return Double(pa * x * pow(1 + x, terms) / (pow(1+x, terms) - 1) - payment);
        }
        
        func FPrime(_ x: Double) -> Double { // f'(x)
            let c_derivative = pow(x+1, terms)
            return Double(pa * pow(x+1, terms-1) *
                (x * c_derivative + c_derivative - (terms*x) - x - 1)) / pow(c_derivative - 1, 2)
        }
        
        while(abs(F(x)) > FINANCIAL_PRECISION) {
            x = x - F(x) / FPrime(x)
        }
        
        let I = Double(12 * x * 100)
        
        if I.isNaN || I.isInfinite || I < 0 {
            return 0.0;
        } else {
            return I
        }
    }
}
