//
//  HomeCoordinator.swift
//  SpotifyClone
//
//  Created by djepbarov on 12.02.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class LibraryCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        let vc = LibraryViewController.instantiate(storyboardName: "Library")
        vc.tabBarItem = UITabBarItem(title: "Library", image: #imageLiteral(resourceName: "library"), selectedImage: #imageLiteral(resourceName: "library"))
        vc.coordinator = self
        navigationController.viewControllers = [vc]
    }
}
