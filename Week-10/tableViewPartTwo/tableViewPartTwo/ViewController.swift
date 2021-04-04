//
//  ViewController.swift
//  tableViewPartTwo
//
//  Created by Dilum De Silva on 2021-04-03.
//

import UIKit

class ViewController: UIViewController {
    
    let data = ["Dilum", "Herath", "Chathura", "Mahinda"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        //Registering cell
        self.tableView.register(UINib(nibName: "customTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

//MARK:- TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? customTableViewCell {
            cell.userName.text = self.data[indexPath.row]
            cell.userAge.text = "20"
            return cell
        }
        return UITableViewCell()
    }
}
