//
//  SavingsViewController.swift
//  SampleCWK
//
//  Created by Dilum De Silva on 2021-02-25.
//  Copyright © 2020 Dilum De Silva. All rights reserved.
//

import UIKit

enum SavingsEntities: Int {
    case presentValue, interest, paymentValue, futureValue, numOfYears
}

class SavingsVC: UIViewController, UITextFieldDelegate, TextFieldsWithPrefix {
    
    @IBOutlet weak var presentValueTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var numberOfCompoundsPerYearTextField: UITextField!
    @IBOutlet weak var paymentValueTextField: UITextField!
    @IBOutlet weak var futureValueTextField: UITextField!
    @IBOutlet weak var numberOfYearsTextField: UITextField!
    
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    @IBOutlet weak var isBeginningUISwitch: UISwitch!
    
    var savingsData : Savings = Savings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assignDelegates()
        self.setupUI()
    }
    
    private func setupUI() {
        // Setting up prefix
        self.addPrefix(textfileds: [presentValueTextField, futureValueTextField, paymentValueTextField],
                       type: .currency)
        self.addPrefix(textfileds: [interestTextField],
                       type: .percentage)
        self.addPrefix(textfileds: [numberOfCompoundsPerYearTextField, numberOfYearsTextField],
                       type: .number)
        
        self.loadTextFieldData()
    }
    
    private func loadTextFieldData() {
        
        savingsData.loadDataFromDefults()
        
        // setting the data
        if let presentValue = savingsData.presentValue, let interest = savingsData.interest, let numberOfCompoundsPerYear = savingsData.numberOfCompoundsPerYear, let paymentValue = savingsData.paymentValue, let futureValue = savingsData.futureValue, let numOfYears = savingsData.numOfYears {
            
            presentValueTextField.text = String(presentValue)
            interestTextField.text = String(interest)
            isBeginningUISwitch.isOn = savingsData.isBeginning
            paymentValueTextField.text = String(paymentValue)
            numberOfCompoundsPerYearTextField.text = String(numberOfCompoundsPerYear)
            futureValueTextField.text = String(futureValue)
            numberOfYearsTextField.text = String(numOfYears)
        }
    }
    
    func assignDelegates() {
        presentValueTextField.delegate = self
        interestTextField.delegate = self
        paymentValueTextField.delegate = self
        futureValueTextField.delegate = self
        presentValueTextField.delegate = self
        numberOfYearsTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
        textField.inputView = UIView()
    }
    
    @IBAction func onTextFieldValueChange(_ sender: UITextField) {
        var doubleTextFieldValue : Double?
        
        if let textFieldValue = sender.text {
            doubleTextFieldValue = Double(textFieldValue)
        } else {
            doubleTextFieldValue = nil
        }
        
        switch SavingsEntities(rawValue: sender.tag)! {
        case .presentValue:
            savingsData.presentValue = doubleTextFieldValue
        case .interest:
            savingsData.interest = doubleTextFieldValue
        case .paymentValue:
            savingsData.paymentValue = doubleTextFieldValue
        case .futureValue:
            savingsData.futureValue = doubleTextFieldValue
        case .numOfYears:
            savingsData.numOfYears = doubleTextFieldValue
        }
    }
    
    @IBAction func onSwitchValueChange(_ sender: UISwitch) {
        savingsData.isBeginning = sender.isOn
    }
    
    @IBAction func onCalculateButtonPressed(_ sender: Any) {
        
        if (savingsData.canCalculate()) {
            let valueCalculated = savingsData.calculateMissingValue().0
            let valueCalculatedType = savingsData.calculateMissingValue().1
            
            switch valueCalculatedType {
            case "presentValue":
                presentValueTextField.text = String(valueCalculated)
                savingsData.presentValue = valueCalculated
            case "interest":
                let alert = UIAlertController(title: Alert.NotSupportedCalculation.title,
                                              message: Alert.NotSupportedCalculation.message, preferredStyle: .alert)
                let done = UIAlertAction(title: AlertAction.OK.rawValue,
                                         style: .default)
                alert.addAction(done)
                present(alert, animated: true, completion: nil)
            case "paymentValue":
                paymentValueTextField.text = String(valueCalculated)
                savingsData.paymentValue = valueCalculated
            case "futureValue":
                futureValueTextField.text = String(valueCalculated)
                savingsData.futureValue = valueCalculated
            case "numOfYears":
                numberOfYearsTextField.text = String(valueCalculated)
                savingsData.numOfYears = valueCalculated
            default:
                print("Default")
            }
            
            // Saving data
            savingsData.saveDataAsUserDefaults()
            
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

