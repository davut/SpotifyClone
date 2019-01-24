//
//  PlaylistCell.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class PlaylistCell: UICollectionViewCell {
    
    var playlist: Playlist? {
        didSet {
            guard let playlist = playlist else {print("No Playlist available"); return}
            playlistTitle.text = playlist.name
            guard let playlistImageName = playlist.imageName else {print("No ImageName available"); return}
            playlistImageView.image = UIImage(named: playlistImageName)
            guard let playlistFollowers = playlist.followers else {print("No followers available"); return}
            followersLabel.text = "\(playlistFollowers) FOLLOWERS"
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
    
    let playlistImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let playlistTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.init(name: "ProximaNova-Bold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = UIFont.init(name: "ProximaNova-Bold", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    func setupViews() {
        addSubview(playlistImageView)
        addSubview(playlistTitle)
        addSubview(followersLabel)
        playlistImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        playlistTitle.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 20)
        followersLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
    }
}
