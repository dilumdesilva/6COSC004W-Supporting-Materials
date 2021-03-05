//
//  PageOneViewController.swift
//  SegueDemo
//
//  Created by Dilum De Silva on 2021-03-05.
//

import UIKit

class PageOne: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //To hide the navigation controller top bar
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    private func setupUI() {
        submitButton.layer.cornerRadius = CGFloat(5)
        nameTextField.placeholder = "Jon Doe"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //The navigation controller top bar
        self.navigationController?.isNavigationBarHidden = false;
        
        if segue.identifier == "submitName" {
            let PageTwoVC: PageTwo = segue.destination as! PageTwo
            PageTwoVC.userName = nameTextField.text
        }
    }
}
