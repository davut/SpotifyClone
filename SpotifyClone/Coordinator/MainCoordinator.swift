//
//  MainCoordinator.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

//class MainCoordinator: Coordinator {
//    var tabBarController: UITabBarController
//
//    init(tabBarController: UITabBarController) {
//        self.tabBarController = tabBarController
//    }
//
//    func start() {
//        let homeTabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
//        let searchTabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), selectedImage: #imageLiteral(resourceName: "search"))
//        let vc = SearchViewController.mainInstantiate()
////        vc.coordinator = self
//        vc.tabBarItem = searchTabBarItem
//
//        let homeVc = HomeViewController.homeInstantiate()
////        homeVc.coordinator = self
//        homeVc.tabBarItem = homeTabBarItem
//        tabBarController.setViewControllers([homeVc, vc], animated: true)
//    }
//}

class MainCoordinator: Coordinator {
    var tabBarController: UITabBarController
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
        tabBarController = UITabBarController()
    }
    
    func start() {
        
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        
            //Back to default navigation bar
//            navigationController.navigationBar.setBackgroundImage(nil, for: .default)
//            navigationController?.navigationBar.shadowImage = nil
        
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
        let searchTabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), selectedImage: #imageLiteral(resourceName: "search"))
        tabBarController.tabBar.backgroundColor = #colorLiteral(red: 0.1812143084, green: 0.1812143084, blue: 0.1812143084, alpha: 1)
        tabBarController.tabBar.barTintColor = #colorLiteral(red: 0.1812143084, green: 0.1812143084, blue: 0.1812143084, alpha: 1)
        tabBarController.tabBar.tintColor = .white
        
        let searchVc = SearchViewController.mainInstantiate()
        searchVc.coordinator = self
        searchVc.tabBarItem = searchTabBarItem
        
        let homeVc = HomeViewController.homeInstantiate()
        homeVc.coordinator = self
        homeVc.tabBarItem = homeTabBarItem
        navigationController.addChild(tabBarController)
        tabBarController.setViewControllers([homeVc, searchVc], animated: true)
    }
    
    
}
