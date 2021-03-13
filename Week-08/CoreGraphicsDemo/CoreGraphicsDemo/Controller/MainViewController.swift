//
//  MainViewController.swift
//  CoreGraphicsDemo
//
//  Created by Dilum De Silva on 2021-03-13.
//

import UIKit
import CoreGraphics

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let mutableString = NSMutableAttributedString(string: "Week 08 - Core Graphics",
                                                      attributes: [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 15.6)!])
        
        titleLabel.text = mutableString.string 
       
    }
    
    

}
