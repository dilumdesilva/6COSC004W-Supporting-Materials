//
//  ViewController.swift
//  TableVeiwDefaultDemo
//
//  Created by Dilum De Silva on 2021-03-27.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var profiles = [
        ProfileModel(name: "Dilum", mobile: "075"),
        ProfileModel(name: "Herath", mobile: "076"),
        ProfileModel(name: "Chaween", mobile: "071")
    ]
    
    @IBOutlet weak var profileContainerTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileContainerTableView.delegate = self
        profileContainerTableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "customCell"
        if let cell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell {
            let profileContent = profiles[indexPath.row]
            
            cell.updateCellView(with: profileContent)
            return cell
        }else {
            return CustomTableViewCell()
        }
    }
    
    
}

