//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, Storyboarded {

    weak var coordinator: MainCoordinator?
    var collections: [Collection]?
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.07590418782, green: 0.07590418782, blue: 0.07590418782, alpha: 1).cgColor]
        gradientLayer.locations = [-0.3, 0.15]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0.0)
        return gradientLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
//            statusBar.backgroundColor = UIColor.black
//            statusBar.alpha = 0.5
//        }
        
        DataSource.loadData { (data) in
            self.collections = data?.collections
            DispatchQueue.main.async {
//                let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
//                self.gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
                self.collectionView.reloadData()
            }
        }
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        collectionView.backgroundColor = .clear
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCell
        let collection = collections?[indexPath.item]
        cell.collection = collection
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = collections?.count else {return 0}
        return count
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
