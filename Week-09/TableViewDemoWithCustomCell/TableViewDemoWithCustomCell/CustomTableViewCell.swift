//
//  CustomTableViewCell.swift
//  TableViewDemoWithCustomCell
//
//  Created by Dilum De Silva on 2021-04-02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
