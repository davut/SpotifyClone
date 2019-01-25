//
//  PlaylistCategory.swift
//  SpotifyClone
//
//  Created by djepbarov on 24.01.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import Foundation

struct Data: Codable {
    var collections: [Collection]?
}

struct Collection: Codable {
    var playlists: [Playlist]?
    var name: String?
}

struct Playlist: Codable {
    var name: String?
    var image: String?
    var followers: String?
}


class PlaylistCategory: NSObject {
    var name: String?
    var playlists: [Playlist]?
    
    static func sampleData() -> [PlaylistCategory] {
        return [PlaylistCategory]()
//        let popularPlaylistsCategory = PlaylistCategory()
//        popularPlaylistsCategory.name = "Popular playlists"
//
//        var playlists = [Playlist]()
//
//        let duaLipaPlaylist = Playlist()
//        duaLipaPlaylist.category = "Popular playlists"
//        duaLipaPlaylist.name = "Dua Lipa"
//        duaLipaPlaylist.imageName = "DuaLipa"
//        duaLipaPlaylist.followers = "8,321,421"
//        playlists.append(duaLipaPlaylist)
//
//        popularPlaylistsCategory.playlists = playlists
//
//        let moreOfWhatYouLikeCategory = PlaylistCategory()
//        moreOfWhatYouLikeCategory.name = "More of what you like"
//
//        var moreOfWhatYouLikePlaylists = [Playlist]()
//        let shawnMendesPlaylist = Playlist()
//        shawnMendesPlaylist.category = "More of what you like"
//        shawnMendesPlaylist.name = "Shawn Mendes"
//        shawnMendesPlaylist.imageName = "ShawnMendes"
//        shawnMendesPlaylist.followers = "6,112,551"
//
//        moreOfWhatYouLikePlaylists.append(shawnMendesPlaylist)
//        moreOfWhatYouLikePlaylists.append(duaLipaPlaylist)
//        moreOfWhatYouLikePlaylists.append(shawnMendesPlaylist)
//
//        moreOfWhatYouLikeCategory.playlists = moreOfWhatYouLikePlaylists
//
//
//        return [popularPlaylistsCategory, moreOfWhatYouLikeCategory]
    }
    
    
    static func loadData(completion: @escaping (Data?)->()) {
        let url = URL(string: "http://localhost:8080/collections")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
            let decoder = JSONDecoder()
            do {
                let json = try? decoder.decode(Data.self, from: data)
                guard let collection = json else {return}
                completion(collection)
            }
            catch let err {
                print(err)
            }
            
//            print(json)
            
            
            
        }
        
        task.resume()
    }
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    static func getPosts(completion: ((Result<[Collection]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost:8080"
        urlComponents.path = "/collection"
//        let userIdItem = URLQueryItem(name: "term", value: "jack")
//        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    // Now we have jsonData, Data representation of the JSON returned to us
                    // from our URLRequest...
                    
                    // Create an instance of JSONDecoder to decode the JSON data to our
                    // Codable struct
                    let decoder = JSONDecoder()
                    
                    do {
                        // We would use Post.self for JSON representing a single Post
                        // object, and [Post].self for JSON representing an array of
                        // Post objects
                        let posts = try decoder.decode([Collection].self, from: jsonData)
                        completion?(.success(posts))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    
    //
    
    
}

