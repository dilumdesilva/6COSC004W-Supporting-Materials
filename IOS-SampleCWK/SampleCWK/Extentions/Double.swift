//
//  Double.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//
import Foundation

extension Double {
    func toFixed(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (divisor*self).rounded() / divisor
    }
}
