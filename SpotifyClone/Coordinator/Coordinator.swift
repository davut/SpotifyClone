//
//  Coordinator.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

protocol Coordinator {
    var tabBarController: UITabBarController {get set}
    func start()
}
