//
//  ViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 13/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let galleryController = UINavigationController(rootViewController: GalleryViewController())
        galleryController.tabBarItem.image = UIImage(named: "galleryIcon")
        galleryController.tabBarItem.title = "Ábuns"
        
        let getInspiredController = UINavigationController(rootViewController: GetInspiredViewController())
        getInspiredController.tabBarItem.image = UIImage(named: "inspirationIcon")
        getInspiredController.tabBarItem.title = "Inpsirações"
        
        viewControllers = [galleryController, getInspiredController]
    }

}
