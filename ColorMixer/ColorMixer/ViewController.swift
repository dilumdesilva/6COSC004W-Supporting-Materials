//
//  ViewController.swift
//  ColorMixer
//
//  Created by Dilum De Silva on 2/5/20.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets for sliders
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    //Outlets for colour label values
    @IBOutlet weak var lblRedValue: UILabel!
    @IBOutlet weak var lblGreenValue: UILabel!
    @IBOutlet weak var lblBlueValue: UILabel!
    
    //Outlet for the imageview
    @IBOutlet weak var colorOutputIamgeView: UIImageView!
    
    //optional type color obj that can be a color or not a color type
    var mixColour:Colour?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        //making sliders corners rounded
        sliderRed.layer.cornerRadius = 15.0
        sliderGreen.layer.cornerRadius = 15.0
        sliderBlue.layer.cornerRadius = 15.0

        //adding a border to the imageview and making it round
        colorOutputIamgeView.backgroundColor = UIColor.white
        colorOutputIamgeView.layer.masksToBounds = false
        colorOutputIamgeView.layer.borderWidth = 3.0
        colorOutputIamgeView.layer.borderColor = UIColor.darkGray.cgColor
        colorOutputIamgeView.layer.cornerRadius = colorOutputIamgeView.frame.size.width / 2
        
        //intializing all the colour label values to zero
        lblRedValue.text = "0"
        lblGreenValue.text = "0"
        lblBlueValue.text = "0"
        
        mixColour = Colour(red: 0.0, green: 0.0, blue: 0.0)
        colorOutputIamgeView.backgroundColor = mixColour?.getColour()
    }

    //trigger when red slider adjusted
    @IBAction func redValueChanged(_ sender: UISlider) {
        lblRedValue.text = String(format: "%.0f", sender.value)
        mixColour?.rValue = sender.value
        colorOutputIamgeView.backgroundColor = mixColour?.getColour()
    }
    //trigger when green slider adjusted
    @IBAction func greenValueChanged(_ sender: UISlider) {
        lblGreenValue.text = String(format: "%.0f", sender.value)
        mixColour?.gValue = sender.value
        colorOutputIamgeView.backgroundColor = mixColour?.getColour()
    }
    //trigger when blue slider adjusted
    @IBAction func blueValueChanged(_ sender: UISlider) {
        lblBlueValue.text = String(format: "%.0f", sender.value)
        mixColour?.bValue = sender.value
        colorOutputIamgeView.backgroundColor = mixColour?.getColour()
    }
}

