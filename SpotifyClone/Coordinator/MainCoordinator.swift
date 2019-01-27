//
//  MainCoordinator.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        
            //Back to default navigation bar
//            navigationController.navigationBar.setBackgroundImage(nil, for: .default)
//            navigationController?.navigationBar.shadowImage = nil
        
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
        let searchTabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), selectedImage: #imageLiteral(resourceName: "search"))
        let libraryTabBarItem = UITabBarItem(title: "Your Library", image: #imageLiteral(resourceName: "library"), selectedImage: #imageLiteral(resourceName: "library"))
        tabBarController.tabBar.backgroundColor = #colorLiteral(red: 0.1406051713, green: 0.1406051713, blue: 0.1406051713, alpha: 1)
        tabBarController.tabBar.barTintColor = #colorLiteral(red: 0.1406051713, green: 0.1406051713, blue: 0.1406051713, alpha: 1)
        tabBarController.tabBar.tintColor = .white
        
        
        let homeVc = HomeViewController.instantiate(storyboardName: "Home")
        homeVc.coordinator = self
        homeVc.tabBarItem = homeTabBarItem
        let homeNavigationController = UINavigationController(rootViewController: homeVc)
        homeNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        homeNavigationController.navigationBar.shadowImage = UIImage()
        
        let searchVc = SearchViewController.instantiate(storyboardName: "Main")
        searchVc.coordinator = self
        searchVc.tabBarItem = searchTabBarItem
        let searchNavigationController = UINavigationController(rootViewController: searchVc)
        setSearchViewControllerTo(navigationItem: searchVc.navigationItem, navigationBar: searchNavigationController.navigationBar)
//        setupNavigationBar(navigationController: searchNavigationController)
        
        
        
        let libraryVc = LibraryViewController.instantiate(storyboardName: "Library")
        libraryVc.coordinator = self
        libraryVc.tabBarItem = libraryTabBarItem
        let libraryNavigationController = UINavigationController(rootViewController: libraryVc)
        
        tabBarController.setViewControllers([homeNavigationController, searchNavigationController, libraryNavigationController], animated: true)
    }
    
    
    func setSearchViewControllerTo(navigationItem: UINavigationItem, navigationBar: UINavigationBar) {
        navigationBar.barStyle = .black
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "artists, songs, or podcasts"
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
}
