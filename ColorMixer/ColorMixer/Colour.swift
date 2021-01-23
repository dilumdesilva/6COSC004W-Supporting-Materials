//
//  Colour.swift
//  ColorMixer
//
//  Created by Dilum De Silva on 2/6/20.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import Foundation
import UIKit

class Colour {
    var rValue:Float = 0.0
    var gValue:Float = 0.0
    var bValue:Float = 0.0
    
    init(red:Float, green:Float, blue:Float) {
        rValue = red
        gValue = green
        bValue = blue
    }
    
    func getColour() -> UIColor {
        let mixerColour = UIColor(
            red: CGFloat(rValue/255.0),
            green: CGFloat(gValue/255.0),
            blue: CGFloat(bValue/255.0), alpha: 1.0)
        return mixerColour
    }
}
