//
//  CustomTableViewCell.swift
//  TableVeiwDefaultDemo
//
//  Created by Dilum De Silva on 2021-03-27.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mobile: UILabel!
    
    func updateCellView(with content: ProfileModel){
        name.text = content.name
        mobile.text = content.mobile
    }
}
