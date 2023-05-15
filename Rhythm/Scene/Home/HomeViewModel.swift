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
    func load()
}

final class HomeViewModel {
    let networkManager = DeezerManager.shared
    weak var delegate: HomeViewModelDelegate?
    var genres: [GenreDatum] = []
    
    init(genres: [GenreDatum]) {
        self.genres = genres
    }
    
}

extension HomeViewModel: HomeViewModelProtocol {
    var numberOfItems: Int {
        genres.count
    }
    
    func load() {
        delegate?.prepareCollectionView()
        delegate?.prepareViews()
    }
    
}
