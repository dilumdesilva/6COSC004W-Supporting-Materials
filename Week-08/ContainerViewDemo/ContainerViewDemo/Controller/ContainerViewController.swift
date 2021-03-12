//
//  ContainerViewController.swift
//  ContainerViewDemo
//
//  Created by Dilum De Silva on 2021-03-13.
//

import UIKit

enum ActionButtons: Int {
    case incrementButton
    case decrementButton
}

class ContainerViewController: UIViewController {

    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    let incrementAndDecrementFactor = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        //bounds vs frame
        print("bounds: \(infoLabel.bounds)")
        print("frame: \(infoLabel.frame)")
    }
    
    private func setupUI() {
        incrementButton.layer.cornerRadius = CGFloat(10)
        decrementButton.layer.cornerRadius = CGFloat(10)
        infoLabel.text = "press to increment or decrement"
    }
    
    //data passing from childVC to MainVC
    @IBAction func actionButtonClicked(_ sender: UIButton) {
        let mainVC = parent as! MainViewController
        
        switch sender.tag {
        case ActionButtons.incrementButton.rawValue:
            mainVC.increment(by: incrementAndDecrementFactor)
        case ActionButtons.decrementButton.rawValue:
        mainVC.decrement(by: incrementAndDecrementFactor)
        default:
            print("Error: Invalid Action Button Type")
        }
        
    }
    
    //data capturing from MainVC to ChildVC
    func updateOperationInfo(with message: String) {
        let msg = "last operation: \(message) \(incrementAndDecrementFactor)"
        infoLabel.text = msg
    }
}
