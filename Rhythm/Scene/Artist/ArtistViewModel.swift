//
//  ArtistViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol ArtistViewModelDelegate: AnyObject {
    func prepareViews()
    func prepareCollectionView()
    func reloadData()
}

protocol ArtistViewModelProtocol {
    var delegate: ArtistViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var name: String { get }
    var image: String { get }
    var followers: Int { get }
    var albums: [Datum] { get }
    func load()
}

final class ArtistViewModel {
    let manager = DeezerManager.shared
    weak var delegate: ArtistViewModelDelegate?
    var artist: Artist?
    var albums: [Datum] = []
    var artistId: Int = 0
    
    var isLoading: Bool = false
    var errorCallback: ((String) -> Void)?
    var successCallback: (() -> Void)?
    
    init(artistId: Int) {
        self.artistId = artistId
    }

    private func fetchArtist(artistId: Int) {
        manager.getArtist(artistId: artistId) { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.artist = result
                self?.fetchArtistAlbums(artistId: artistId)
                self?.delegate?.prepareViews()
            }
        }
    }
    
    private func fetchArtistAlbums(artistId: Int) {
        manager.getArtistAlbums(artistId: artistId) { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.albums = result.data
                self?.delegate?.reloadData()
            }
        }
    }
    
}

extension ArtistViewModel: ArtistViewModelProtocol {
    
    var followers: Int {
        artist?.nbFan ?? 0
    }
    
    var name: String {
        artist?.name ?? ""
    }
    
    var image: String {
        artist?.pictureBig ?? ""
    }
    
    var numberOfItems: Int {
        albums.count
    }
    
    func load() {
        fetchArtist(artistId: artistId)
        delegate?.prepareCollectionView()
    }
    
}
