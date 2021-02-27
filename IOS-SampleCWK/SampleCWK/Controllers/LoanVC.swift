//
//  LoanViewController.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import UIKit

enum LoanEntities: Int {
    case loanAmount, interest, payment, numOfPayments
}

class LoanVC: UIViewController, UITextFieldDelegate, TextFieldsWithPrefix {
    
    @IBOutlet weak var loanAmountTf: UITextField!
    @IBOutlet weak var interestTf: UITextField!
    @IBOutlet weak var paymentTf: UITextField!
    @IBOutlet weak var numOfPaymentsTf: UITextField!
    @IBOutlet weak var keyboard: CustomKeyboard!
    
    // Getting the data from the model
    var loanData : Loan = Loan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        // Loading initial data to textfields
        self.loadTextFieldData()
        
        // adding prefixs to texfields
        self.addPrefix(textfileds: [loanAmountTf, paymentTf], type: .currency)
        self.addPrefix(textfileds: [interestTf], type: .percentage)
        self.addPrefix(textfileds: [numOfPaymentsTf], type: .number)
    }
    
    func loadTextFieldData() {
        // Getting data
        loanData.loadDataFromStorage()
        
        // setting the data
        if let loanAmount = loanData.loanAmount, let interest = loanData.interest, let payment = loanData.payment, let numOfPayments = loanData.numOfPayments {
            loanAmountTf.text = String(loanAmount)
            paymentTf.text = String(payment)
            interestTf.text = String(interest)
            numOfPaymentsTf.text = String(numOfPayments)
        }
    }
    
    func assignDelegates() {
        loanAmountTf.delegate = self
        interestTf.delegate = self
        paymentTf.delegate = self
        numOfPaymentsTf.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboard.activeTextField = textField
        textField.inputView = UIView()
    }
    
    
    @IBAction func onTfValueChange(_ sender: UITextField) {
        var doubleTextFieldValue : Double?
        
        if let textFieldValue = sender.text {
            doubleTextFieldValue = Double(textFieldValue)
        } else {
            doubleTextFieldValue = nil
        }
        
        switch LoanEntities(rawValue: sender.tag)! {
            case .loanAmount:
                loanData.loanAmount = doubleTextFieldValue
            case .interest:
                loanData.interest = doubleTextFieldValue
            case .payment:
                loanData.payment = doubleTextFieldValue
            case .numOfPayments:
                loanData.numOfPayments = doubleTextFieldValue
        }
    }
    
    @IBAction func onCalculatePressed(_ sender: Any) {
        
        if (loanData.canCalculate()) {
            let valueCalculated = loanData.calculateMissingValue().0
            let valueCalculatedType = loanData.calculateMissingValue().1
 
            switch valueCalculatedType {
                case "loanAmount":
                    loanAmountTf.text = String(valueCalculated)
                    loanData.loanAmount = valueCalculated
                case "interest":
                    interestTf.text = String(valueCalculated)
                    loanData.interest = valueCalculated
                case "payment":
                    paymentTf.text = String(valueCalculated)
                    loanData.payment = valueCalculated
                case "numOfPayments":
                    numOfPaymentsTf.text = String(valueCalculated)
                    loanData.numOfPayments = valueCalculated
                default:
                    print("Default")
            }
            
            // Saving data
            loanData.saveDataToStorage()
            
        } else {
            let alert = UIAlertController(title: Alert.InvalidCalculation.title,
                                          message: Alert.InvalidCalculation.message,
                                          preferredStyle: .alert)
            let done = UIAlertAction(title: AlertAction.OK.rawValue,
                                     style: .default)
            alert.addAction(done)
            present(alert, animated: true, completion: nil)
            
            
        }
    }    
}

