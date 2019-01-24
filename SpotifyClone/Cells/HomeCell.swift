//
//  HomeCell.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var playlistCategory: PlaylistCategory? {
        didSet {
            guard let name = playlistCategory?.name else {return}
            bigTitle.text = name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let albumsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionViewFrame = CGRect(x: 8, y: 5, width: UIScreen.main.bounds.width - 16, height: 300)
        let collectionView = UICollectionView(frame: collectionViewFrame , collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let bigTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "ProximaNova-Bold", size: 20)
        label.textAlignment = .center
//        label.text = "Popular playlists"
        return label
    }()
    
    func setupViews() {
        backgroundColor = .clear
        addSubview(albumsCollectionView)
        addSubview(bigTitle)
        bigTitle.frame = CGRect(x: 8, y: 0, width: UIScreen.main.bounds.width, height: 20)
        albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
        albumsCollectionView.register(PlaylistCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = playlistCategory?.playlists?.count else {return 0}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlaylistCell
        let playlistName = playlistCategory?.playlists?[indexPath.item]
        cell.playlist = playlistName
        return cell
    }
}
