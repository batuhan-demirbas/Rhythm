//
//  AlbumViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol AlbumViewModelDelegate: AnyObject {
    func prepareViews()
    func prepareCollectionView()
    func reloadData()
}

protocol AlbumViewModelProtocol {
    var delegate: AlbumViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var title: String { get }
    var image: String { get }
    var artistName: String { get }
    func getTrack(indexPath: IndexPath) -> TracksDatum
    func load()
    func updateFavorites()
}

final class AlbumViewModel {
    let networkManager = DeezerManager.shared
    let coreDatakManager = CoreDataManager.shared
    weak var delegate: AlbumViewModelDelegate?
    var album: Album?
    var albumId: Int = 0
    var favorites: [Favorites] = []
    
    var errorCallback: ((String) -> Void)?
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
    private func fetchAlbum(albumId: Int) {
        networkManager.getAlbum(albumId: albumId) { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.album = result
                self?.delegate?.reloadData()
                self?.delegate?.prepareViews()
            }
        }
    }
    
    private func fetchFavorites() {
        favorites = coreDatakManager.fetchFavorites()
    }
    
    private func removeFavorites(favorite: Favorites) {
        coreDatakManager.deleteFavorite(favorite: favorite)
    }
    
    private func addFavorites(track: TracksDatum) {
        coreDatakManager.saveFavorite(id: track.id, trackName: track.title, artistName: track.artist.name, image: track.album.coverBig, link: track.preview, duration: track.duration)
    }
    
}

extension AlbumViewModel: AlbumViewModelProtocol {
    
    var title: String {
        album?.title ?? ""
    }
    
    var artistName: String {
        album?.artist.name ?? ""
    }
    
    var image: String {
        album?.coverBig ?? ""
    }
    
    var numberOfItems: Int {
        album?.tracks.data.count ?? 0
    }
    
    func getTrack(indexPath: IndexPath) -> TracksDatum {
        return (album?.tracks.data[indexPath.row])!
    }
    
    func removeFavorites(track: Favorites) {
        removeFavorites(favorite: track)
    }
    func addFavorite(track: TracksDatum) {
        addFavorites(track: track)
    }
    
    func load() {
        fetchFavorites()
        fetchAlbum(albumId: albumId)
        delegate?.prepareCollectionView()
        delegate?.prepareViews()
    }
    
    func updateFavorites() {
        fetchFavorites()
        delegate?.prepareCollectionView()
    }
    
}

