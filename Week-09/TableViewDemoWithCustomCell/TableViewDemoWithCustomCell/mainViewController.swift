//
//  mainViewController.swift
//  TableViewDemoWithCustomCell
//
//  Created by Dilum De Silva on 2021-04-02.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet weak var customTableView: UITableView!
    
    let data = ["Nisal","Kamal","Sunil","Chathura","Sampath"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.customTableView.dataSource = self
        self.customTableView.delegate = self
    }

}

// MARK:- TableView Delegate and Datasource

extension mainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = customTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell {
            cell.nameLabel.text = self.data[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
