//
//  AddReminderVC.swift
//  RemindersDemo
//
//  Created by Dilum De Silva on 2021-04-24.
//

import UIKit

class AddReminderVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var reminderTitleTF: UITextField!
    @IBOutlet weak var reminderBodyTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    var completion: ((String, String, Date)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        reminderTitleTF.delegate = self
        reminderBodyTF.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveReminder))
    }
    
    @objc func didTapSaveReminder() {
        if let reminderTitleText = reminderTitleTF.text, !reminderTitleText.isEmpty,
           let reminderdescriptionText = reminderBodyTF.text, !reminderdescriptionText.isEmpty {
            
            let reminderDate = datePicker.date
            
            completion?(reminderTitleText,
                        reminderdescriptionText,
                        reminderDate)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
