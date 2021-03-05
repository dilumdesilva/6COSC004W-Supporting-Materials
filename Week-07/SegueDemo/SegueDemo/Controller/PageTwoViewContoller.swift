//
//  PageTwoViewContoller.swift
//  SegueDemo
//
//  Created by Dilum De Silva on 2021-03-05.
//

import UIKit

class PageTwo: UIViewController {
    var userName: String?
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        let greet = "Hello \(userName ?? "")"
        greetingLabel.text = greet
    } 
}
    
