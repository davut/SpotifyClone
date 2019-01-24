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
    var playlistCategories: [PlaylistCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistCategories = PlaylistCategory.sampleData()
        PlaylistCategory.getPosts(for: 1) { (posts) in
            print(posts)
        }
        collectionView.backgroundColor = .black
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCell
        let playlistCategory = playlistCategories?[indexPath.item]
        cell.playlistCategory = playlistCategory
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = playlistCategories?.count else {return 0}
        return count
    }
}
