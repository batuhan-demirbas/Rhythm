//
//  CategoryViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol CategoryViewModelDelegate: AnyObject {
    func prepareViews()
    func prepareCollectionView()
    func reloadData()
}

protocol CategoryViewModelProtocol {
    var delegate: CategoryViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var genreName: String { get }
    var artists: [ArtistsDatum] { get }
    func load()
}

final class CategoryViewModel {
    let manager = DeezerManager.shared
    weak var delegate: CategoryViewModelDelegate?
    private let genre: GenreDatum?
    var artists: [ArtistsDatum] = []
    var filteredArtists: [ArtistsDatum] = []
    
    init(genre: GenreDatum) {
        self.genre = genre
    }
    
    var errorCallback: ((String) -> Void)?
    
    private func fetchArtists(genreId: Int) {
        manager.getArtists(genreId: genreId) { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.artists = result.data
                self?.filteredArtists = result.data
                self?.delegate?.reloadData()
            }
        }
    }
    
}

extension CategoryViewModel: CategoryViewModelProtocol {
    
    var numberOfItems: Int {
        filteredArtists.count
    }
    
    var genreName: String {
        genre?.name ?? ""
    }
    
    func load() {
        delegate?.prepareViews()
        delegate?.prepareCollectionView()
        fetchArtists(genreId: genre?.id ?? 0)
    }
    
    func filterArtist(searchText: String) {
        if searchText != "" {
            filteredArtists = artists.filter({ $0.name.lowercased().contains(searchText.lowercased()) == true })
        } else {
            filteredArtists = artists
        }
    }
}
