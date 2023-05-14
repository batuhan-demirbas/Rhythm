//
//  DeezerManager.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol DeezerManagerProtocol {
    func getGenres(complete: @escaping((Genre?, Error?)->()))
    func getArtists(genreId: Int, complete: @escaping((Artists?, Error?)->()))
    func getArtist(artistId: Int, complete: @escaping((Artist?, Error?)->()))
    func getArtistAlbums(artistId: Int, complete: @escaping((Albums?, Error?)->()))
    func getAlbum(albumId: Int, complete: @escaping((Album?, Error?)->()))
}

final class DeezerManager: DeezerManagerProtocol {
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
    
    func getArtists(genreId: Int, complete: @escaping ((Artists?, Error?) -> ())) {
        NetworkManager.shared.request(type: Artists.self, url: DeezerEndpoint.genre.path + String(genreId) + "/artists", method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getArtist(artistId: Int, complete: @escaping ((Artist?, Error?) -> ())) {
        NetworkManager.shared.request(type: Artist.self, url: DeezerEndpoint.artist.path + String(artistId), method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getArtistAlbums(artistId: Int, complete: @escaping ((Albums?, Error?) -> ())) {
        NetworkManager.shared.request(type: Albums.self, url: DeezerEndpoint.artist.path + String(artistId) + "/albums", method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getAlbum(albumId: Int, complete: @escaping ((Album?, Error?) -> ())) {
        NetworkManager.shared.request(type: Album.self, url: DeezerEndpoint.album.path + String(albumId), method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case.failure(let error):
                complete(nil, error)
            }
        }
    }
    
}

