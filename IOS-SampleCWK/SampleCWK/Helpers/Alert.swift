//
//  Alerts.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-26.
//  Copyright © 2021 Devon Wijesinghe. All rights reserved.
//

import Foundation

enum AlertAction: String {
    case OK = "Ok"
}

struct Alert {
    struct InvalidCalculation {
        static let title = "Invalid Calculation!"
        static let message = "Only one field empty at a time should be empty!"
    }
    
    struct NotSupportedCalculation {
        static let title = "Not Supported!"
        static let message = "Interest calculation is not supported!"
        
    }
}
