//
//  SceneDelegate.swift
//  MasterDetailDemo
//
//  Created by Dilum De Silva on 2021-04-17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let splitVC = window?.rootViewController
                as? UISplitViewController,
            let leftNavigationVC = splitVC.viewControllers.first
                as? UINavigationController,
            let masterVC = leftNavigationVC.viewControllers.first
                as? MasterViewController,
            let detailVC = (splitVC.viewControllers.last
                                as? UINavigationController)?.topViewController as? DetailViewController
        else { fatalError() }
        
        let firstPet = masterVC.pets.first
        detailVC.pet = firstPet
        masterVC.delegate = detailVC
        
        
    }

}

