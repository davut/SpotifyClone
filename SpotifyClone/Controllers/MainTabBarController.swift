//
//  MainTabBarController.swift
//  SpotifyClone
//
//  Created by djepbarov on 12.02.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController ,Storyboarded {
    let home = HomeCoordinator()
    let search = SearchCoordinator()
    let library = LibraryCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.barTintColor = #colorLiteral(red: 0.1406051713, green: 0.1406051713, blue: 0.1406051713, alpha: 1)
        tabBar.tintColor = .white
        viewControllers = [home.navigationController, search.navigationController, library.navigationController]
//        setViewControllers([home.navigationController, search.navigationController, library.navigationController], animated: true)
    }
}
