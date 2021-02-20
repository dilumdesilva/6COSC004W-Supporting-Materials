//
//  Helper.swift
//  ColorMixer
//
//  Created by Dilum De Silva on 2021-02-20.
//

import UIKit

class Helper{
    static func readPlist(withName name: String) -> NSDictionary? {
        if let path =  Bundle.main.path(forResource: name, ofType: "plist"){
            let dict = NSDictionary(contentsOfFile: path)
            return dict
        }
        return nil
    }
}
