//
//  Collection.swift
//  SpotifyClone
//
//  Created by djepbarov on 26.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import Foundation

struct Collection: Codable {
    var playlists: [Playlist]?
    var name: String?
}
