//
//  DetailViewController.swift
//  MasterDetailDemo
//
//  Created by Dilum De Silva on 2021-04-17.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petAgeLabel: UILabel!
    @IBOutlet weak var petOwnerLabel: UILabel!
    
    var pet: Pet? {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI() {
       loadViewIfNeeded()
        petImage.image = pet?.type.image
        petNameLabel.text = pet?.name
        petAgeLabel.text = pet?.age
        petOwnerLabel.text = pet?.owner
    }

}

extension DetailViewController: PetSelectionDelegate {
    func petSelected(_ newPet: Pet) {
        pet = newPet
    }
}
