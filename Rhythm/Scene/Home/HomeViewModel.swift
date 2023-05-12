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
    let manager = DeezerManager.shared
    weak var delegate: HomeViewModelDelegate?
    var genres: [GenreDatum] = []
    
    init(genres: [GenreDatum]) {
        self.genres = genres
    }

    var isLoading: Bool = false
    var errorCallback: ((String) -> Void)?
    var successCallback: (() -> Void)?
    
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
