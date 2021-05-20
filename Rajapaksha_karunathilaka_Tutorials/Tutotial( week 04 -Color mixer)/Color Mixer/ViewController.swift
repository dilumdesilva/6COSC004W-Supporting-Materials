//
//  ViewController.swift
//  Color Mixer
//
//  Created by Spemai-Macbook on 2021-01-23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblRedValue: UILabel!
    @IBOutlet weak var lblGreenValue: UILabel!
    @IBOutlet weak var lblBlueValue: UILabel!
    @IBOutlet weak var viwColor: UIView!
    
    var valueRed:CGFloat   = 0
    var valueGreen:CGFloat = 0
    var valueBlue :CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        
        if sender.tag == 1 {
            
            valueRed         = CGFloat(sender.value)
            lblRedValue.text = "\(Int(valueRed))"
            
        } else if  sender.tag == 2 {
            
            valueGreen         = CGFloat(sender.value)
            lblGreenValue.text = "\(Int(valueGreen))"
            
        } else if  sender.tag == 3  {
            
            valueBlue         = CGFloat(sender.value)
            lblBlueValue.text = "\(Int(valueBlue))"
            
        }
                
        self.viwColor.backgroundColor = UIColor(red: valueRed/255.0, green: valueGreen/255.0, blue: valueBlue/255.0, alpha: 1)
        
    }
    
}

