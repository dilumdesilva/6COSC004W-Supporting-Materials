//
//  MainViewController.swift
//  ContainerViewDemo
//
//  Created by Dilum De Silva on 2021-03-12.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var counterOutputLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupUI() {
        counterOutputLabel.text = "0"
    }
    
    func increment(by someCount: Int) {
        count += someCount
        updateCounterOutput(with: count, "incremented by")
    }
    
    func decrement(by someCount: Int) {
        count -= someCount
        updateCounterOutput(with: count, "decremented by")
    }
    
    private func updateCounterOutput(with newCount: Int, _ message: String) {
        let updatedCount = String(newCount)
        counterOutputLabel.text = updatedCount
        
        //data passing from MainVC to childVC
        let childVC = children.last as! ContainerViewController
        childVC.updateOperationInfo(with: message)
    }
}
