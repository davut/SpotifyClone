//
//  Storyboarded.swift
//  SpotifyClone
//
//  Created by djepbarov on 23.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func mainInstantiate() -> Self
    static func homeInstantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func mainInstantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    static func homeInstantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    
}
