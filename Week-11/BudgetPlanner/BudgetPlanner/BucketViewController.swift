//
//  BucketViewController.swift
//  BudgetPlanner
//
//  Created by Dilum De Silva on 2021-04-03.
//

import UIKit
import CoreData

class BucketViewController: UIViewController {
    
    @IBOutlet weak var expenseTableView: UITableView!
    @IBOutlet weak var bucketName: UILabel!
    @IBOutlet weak var bucketMaxLimitLabel: UILabel!
    
    @IBOutlet weak var expenseNameTF: UITextField!
    @IBOutlet weak var expenseAmountTF: UITextField!
    
    var bucket: Bucket?
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.expenseTableView.delegate = self
        self.expenseTableView.dataSource = self
        
        if let bucket = bucket {
            bucketName.text = bucket.name
            bucketMaxLimitLabel.text = "Max limit - \(bucket.size?.stringValue ?? "0")$"
            
            if let allExpenses = bucket.expenses?.allObjects as? [Expense]
            {
                expenses = allExpenses
            }
        }
    }
    
    @IBAction func saveExpense(_ sender: UIButton) {
        
        guard let newBucket = bucket else {return}
        
        guard let expenseName = expenseNameTF.text else {
            print("Error - expenseNameTF")
            return
        }
        guard let expenseAmountText = expenseAmountTF.text else {
            print("Error - expenseAmountTF")
            return
        }
        
        let expenseAmount = NSDecimalNumber(string: expenseAmountText)
        
        let expense = DataManger.shared.expense(name: expenseName, amount: expenseAmount, bucket: newBucket)
        expenses.append(expense)
        expenseTableView.reloadData()
        DataManger.shared.save()
    }
    
}


//MARK:- TableView
extension BucketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expenseTableView.dequeueReusableCell(withIdentifier: "expensesCell", for: indexPath)
        let expense = expenses[indexPath.row]
        cell.textLabel?.text = expense.expenseName
        cell.detailTextLabel?.text = "amount: \(expense.amount?.stringValue ?? "0")$"
        return cell
    }
    
    
}
