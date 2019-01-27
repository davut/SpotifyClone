//
//  DataSource.swift
//  SpotifyClone
//
//  Created by djepbarov on 26.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import Foundation

class DataSource {
    static func loadData(completion: @escaping (Data?)->()) {
        let url = URL(string: "https://spotifycloneapi.herokuapp.com/collections")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            let json = try? decoder.decode(Data.self, from: data)
            guard let collection = json else {return}
            completion(collection)
        }
        
        task.resume()
    }
}
