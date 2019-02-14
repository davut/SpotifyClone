//
//  ViewController.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, Storyboarded {
    
    var playlistPop: Playlist = {
        var playlist = Playlist()
        playlist.name = "Pop"
        playlist.image = "SeaWeed"
        return playlist
    }()
    
    var playlistFolk: Playlist = {
        var playlist = Playlist()
        playlist.name = "Folk & Acoustic"
        playlist.image = "blackGreen"
        return playlist
    }()
    
    var playlistRock: Playlist = {
        var playlist = Playlist()
        playlist.name = "Rock"
        playlist.image = "redDark"
        return playlist
    }()
    
    var playlistRnB: Playlist = {
        var playlist = Playlist()
        playlist.name = "R&B"
        playlist.image = "pink"
        return playlist
    }()
    
    lazy var topGenresCollection: Collection = {
        var collection = Collection()
        collection.name = "Your top genres"
        collection.playlists = [playlistPop, playlistRnB, playlistFolk, playlistRock]
        return collection
    }()
    
    var playlistPodcasts: Playlist = {
        var playlist = Playlist()
        playlist.name = "Podcasts"
        playlist.image = "orange"
        return playlist
    }()
    
    var playlistCharts: Playlist = {
        var playlist = Playlist()
        playlist.name = "Charts"
        playlist.image = "SeaWeed"
        return playlist
    }()
    
    var playlistNewReleases: Playlist = {
        var playlist = Playlist()
        playlist.name = "New Releases"
        playlist.image = "blueWhite"
        return playlist
    }()
    
    var playlistRadio: Playlist = {
        var playlist = Playlist()
        playlist.name = "Radio"
        playlist.image = "purplePink"
        return playlist
    }()
    
    var playlistDiscover: Playlist = {
        var playlist = Playlist()
        playlist.name = "Discover"
        playlist.image = "Purplin"
        return playlist
    }()
    
    lazy var browseAllCollection: Collection = {
        var collection = Collection()
        collection.name = "Browse All"
        collection.playlists = [playlistPodcasts, playlistCharts, playlistNewReleases, playlistRadio, playlistDiscover, playlistRnB, playlistFolk, playlistRock, playlistPop, playlistNewReleases, playlistRock, playlistPop, playlistRadio, playlistRock, playlistPop, playlistPodcasts, playlistFolk, playlistCharts]
        return collection
    }()
    
    weak var coordinator: SearchCoordinator?
    
    var collections: [Collection]?
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.07590418782, green: 0.07590418782, blue: 0.07590418782, alpha: 1).cgColor]
        gradientLayer.locations = [-0.3, 0.15]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        return gradientLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = coordinator?.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        DataSource.loadData { (data) in
            self.collections = [self.topGenresCollection, self.browseAllCollection]
            DispatchQueue.main.async {
                self.collectionView.sizeToFit()
                self.collectionView.reloadData()
            }
        }
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        collectionView.backgroundColor = .clear
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCell
        let collection = collections?[indexPath.row]
        cell.collection = collection
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = collections?.count else {return 0}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 250)
        } else {
            guard let numberOfPlaylists = collections?[indexPath.row].playlists?.count else {return CGSize.zero}
            
//            let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            return CGSize(width: UIScreen.main.bounds.width, height: CGFloat((numberOfPlaylists / 2) * 120))
        }
    }
}

class SearchCell: HomeCell {
    override func setupViews() {
        super.setupViews()
        bigTitle.frame = CGRect(x: 16, y: 10, width: UIScreen.main.bounds.width, height: 20)
        bigTitle.textAlignment = .left
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        albumsCollectionView.collectionViewLayout = layout
        albumsCollectionView.register(TypeCell.self, forCellWithReuseIdentifier: "cell")
        albumsCollectionView.frame = CGRect(x: 8, y: 20, width: UIScreen.main.bounds.width - 16, height: 2000)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TypeCell
        let playlistName = collection?.playlists?[indexPath.item]
        cell.playlist = playlistName
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2 - 30, height: 105)
    }
}

class TypeCell: PlaylistCell {
    override func setupViews() {
        super.setupViews()
        playlistImageView.frame = CGRect(x: 0, y: 22, width: frame.width, height: 100)
        playlistImageView.addSubview(playlistTitle)
        playlistImageView.layer.cornerRadius = 5
        
        playlistTitle.frame = CGRect(x: 10, y: 10, width: playlistImageView.frame.width - 16, height: 25)
        playlistTitle.font = UIFont(name: "ProximaNova-Bold", size: 20)
        playlistTitle.numberOfLines = 2
        playlistTitle.textAlignment = .left
        
        followersLabel.removeFromSuperview()
    }
    
    
}
