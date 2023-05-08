//
//  DeezerManager.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol DeezerManagerProtocol {
    func getGenres(complete: @escaping((Genre?, Error?)->()))
}

class DeezerManager: DeezerManagerProtocol {
    static let shared = DeezerManager()
    
    func getGenres(complete: @escaping((Genre?, Error?)->())) {
        NetworkManager.shared.request(type: Genre.self, url: DeezerEndpoint.genre.path, method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    /*
    func getLocation(page: String, complete: @escaping((Location?, Error?)->())) {
        NetworkManager.shared.request(type: Location.self, url: HomeEndpoint.location.path + "?page=\(page)", method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getMultipleCharacters(ids: [String], complete: @escaping(([Character]?, Error?)->())) {
        let joinedIds = ids.joined(separator: ",")
        NetworkManager.shared.request(type: [Character].self, url: HomeEndpoint.character.path + "/\(joinedIds),", method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
     */
}

