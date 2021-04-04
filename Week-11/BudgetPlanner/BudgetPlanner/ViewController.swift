//
//  ViewController.swift
//  BudgetPlanner
//
//  Created by Dilum De Silva on 2021-04-03.
//

import UIKit
import CoreData

enum error: String {
    case inputError = "Error: invalid input"
    case dataFetchError = "CoreDataError: error in fetching data"
    case dataSaveError = "CoreDataError: error in saving data"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bucketNameTextField: UITextField!
    @IBOutlet weak var bucketSizeTextField: UITextField!
    
    var buckets: [Bucket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //load data
        buckets = DataManger.shared.buckets()
        tableView.reloadData()
    }
    
    @IBAction func saveBucket(_ sender: UIButton) {
        guard let bucketName = bucketNameTextField.text else {
            print("\(error.inputError) - bucketNameTextField")
            return
        }
        
        guard let buckeSizeText = bucketSizeTextField.text else {
            print("\(error.inputError) - bucketSizeTextField")
            return
        }
        let bucketSize = NSDecimalNumber(string: buckeSizeText)
        
        let bucket = DataManger.shared.bucket(name: bucketName,
                                              size: bucketSize)
        buckets.append(bucket)
        tableView.reloadData()
        DataManger.shared.save()
        reset()
    }
    
    private func reset() {
        bucketNameTextField.text = ""
        bucketSizeTextField.text = ""
    }
    
    @IBSegueAction func openBucket(_ coder: NSCoder) -> BucketViewController? {
        let vc = BucketViewController(coder: coder)
        guard let indexPath =  tableView.indexPathForSelectedRow else {
            return vc
        }

        let bucket = buckets[indexPath.row]
        vc?.bucket = bucket
        tableView.deselectRow(at: indexPath, animated: true)
        return vc
    }
    
    
}

//MARK:- TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buckets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let bucket = buckets[indexPath.row]
        cell.textLabel?.text = bucket.name
        cell.detailTextLabel?.text = "size: \(bucket.size?.stringValue ?? "0")$"
        return cell
    }
    
    
}
