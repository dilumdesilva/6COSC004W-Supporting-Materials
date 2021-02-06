//
//  ColorMixerVController.swift
//  ColorMixer
//
//  Created by Dilum De Silva on 2021-01-30.
//

import UIKit

class ColorMixerVController: UIViewController {

    //Red
    @IBOutlet weak var lblRedValue: UILabel!
    @IBOutlet weak var redValueSlider: UISlider!
    
    //Green
    @IBOutlet weak var lblGreenValue: UILabel!
    @IBOutlet weak var greenValueSlider: UISlider!
    
    //Blue
    @IBOutlet weak var lblBlueValue: UILabel!
    @IBOutlet weak var blueValueSlider: UISlider!
    
    //output
    @IBOutlet weak var colorOutputImageView: UIImageView!
    
    var generatedColor:Colour?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        lblRedValue.text = "0"
        lblGreenValue.text = "0"
        lblBlueValue.text = "0"
        
        redValueSlider.tintColor = UIColor.red
        redValueSlider.thumbTintColor = UIColor.red
        
        greenValueSlider.tintColor = UIColor.green
        greenValueSlider.thumbTintColor = UIColor.green
        
        blueValueSlider.tintColor = UIColor.blue
        blueValueSlider.thumbTintColor = UIColor.blue
        
        //color output pannel
        generatedColor = Colour(red: 0.0, green: 0.0, blue: 0.0)
        colorOutputImageView.backgroundColor = generatedColor?.getColour()
        
        colorOutputImageView.layer.borderWidth = 2.0
        colorOutputImageView.layer.borderColor = UIColor.darkGray.cgColor
        colorOutputImageView.layer.masksToBounds = false
        
        colorOutputImageView.layer.cornerRadius = colorOutputImageView.frame.size.width/2
        
    }
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        lblRedValue.text = String(format: "%.0f", sender.value)
        generatedColor?.redValue = sender.value
        colorOutputImageView.backgroundColor = generatedColor?.getColour()
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        lblGreenValue.text = String(format: "%.0f", sender.value)
        generatedColor?.greeValue = sender.value
        colorOutputImageView.backgroundColor = generatedColor?.getColour()
    }
    
    @IBAction func blueVlueChanged(_ sender: UISlider) {
        lblBlueValue.text = String(format: "%.0f", sender.value)
        generatedColor?.blueValue = sender.value
        colorOutputImageView.backgroundColor = generatedColor?.getColour()
    }
    
}
