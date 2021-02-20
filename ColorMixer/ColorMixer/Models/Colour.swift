//
//  Colour.swift
//  ColorMixer
//
//  Created by Dilum De Silva on 2021-01-30.
//

import Foundation
import UIKit

class Colour: Codable {
    var redValue: Float = 0.0
    var greeValue: Float = 0.0
    var blueValue: Float = 0.0
    
    var rgbRange: Float =  255.0
    
    init(red: Float, green: Float, blue: Float) {
        redValue = red
        greeValue = green
        blueValue = blue
    }
    
    //MARK: returns the mixed colour
    func getColour() -> UIColor {
        let generatedColor = UIColor(
            red: CGFloat(redValue/rgbRange),
            green: CGFloat(greeValue/rgbRange),
            blue: CGFloat(blueValue/rgbRange),
            alpha: 1.0
        )
        return generatedColor
    }
}
