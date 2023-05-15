//
//  HomeViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func prepareViews()
    func prepareCollectionView()
    func reloadData()
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var genres: [GenreDatum] { get }
    var filteredGenres: [GenreDatum] { get }
    func load()
    func filterGenre(searchText: String)
}

final class HomeViewModel {
    let networkManager = DeezerManager.shared
    weak var delegate: HomeViewModelDelegate?
    var genres: [GenreDatum] = []
    var filteredGenres: [GenreDatum] = []
    
    init(genres: [GenreDatum]) {
        self.genres = genres
        self.filteredGenres = genres
    }
    
}

extension HomeViewModel: HomeViewModelProtocol {
    var numberOfItems: Int {
        filteredGenres.count
    }
    
    func load() {
        delegate?.prepareCollectionView()
        delegate?.prepareViews()
    }
    
    func filterGenre(searchText: String) {
        if searchText != "" {
            filteredGenres = genres.filter({ $0.name.lowercased().contains(searchText.lowercased()) == true })
        } else {
            filteredGenres = genres
        }
    }
    
}
