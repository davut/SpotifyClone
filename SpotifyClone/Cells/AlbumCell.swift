//
//  AlbumCell.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
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
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "a59ba61362a7301facba81a94c9cb1d9d4496b3a")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let albumTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.init(name: "ProximaNova-Bold", size: 16)
        label.text = "Dua Lipa"
        label.textAlignment = .center
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = UIFont.init(name: "ProximaNova-Bold", size: 12)
        label.text = "7,002,222 FOLLOWERS"
        label.textAlignment = .center
        return label
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(albumTitle)
        addSubview(followersLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        albumTitle.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 20)
        followersLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
    }
}
