//
//  CategoryViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol CategoryViewModelDelegate: AnyObject {
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
    
    init(genre: GenreDatum) {
        self.genre = genre
    }
    
    var isLoading: Bool = false
    var errorCallback: ((String) -> Void)?
    var successCallback: (() -> Void)?
    
    private func fetchArtists(genreId: Int) {
        manager.getArtists(genreId: genreId) { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.artists = result.data
                self?.delegate?.reloadData()
                self?.successCallback?()
            }
        }
    }
    
}

extension CategoryViewModel: CategoryViewModelProtocol {
    var numberOfItems: Int {
        artists.count
    }
    
    var genreName: String {
        genre?.name ?? ""
    }
    
    func load() {
        delegate?.prepareCollectionView()
        fetchArtists(genreId: genre?.id ?? 0)
    }
}
