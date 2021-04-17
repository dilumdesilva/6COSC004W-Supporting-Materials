//
//  Pet.swift
//  MasterDetailDemo
//
//  Created by Dilum De Silva on 2021-04-17.
//

import UIKit

enum PetType {
    case dog, cat, parrot
    
    var image: UIImage {
        switch self {
        case .dog:
            return UIImage(named: "dog.png")!
        case .cat:
            return UIImage(named: "cat.png")!
        case .parrot:
            return UIImage(named: "parrot.png")!
        }
    }
}

class Pet {
    let name: String
    let owner: String
    let age: String
    let type: PetType
    
    init(name: String, owner: String, age: String, type: PetType) {
        self.name = name
        self.owner = owner
        self.age = age
        self.type = type
    }
}

