//
//  FavoriteViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol FavoriteViewModelDelegate: AnyObject {
    func prepareViews()
    func prepareCollectionView()
    func reloadData()
}

protocol FavoriteViewModelProtocol {
    var delegate: FavoriteViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var favorites: [Favorites] { get }
    func load()
    func remove(favorite: Favorites)
}

final class FavoriteViewModel {
    let manager = CoreDataManager.shared
    weak var delegate: FavoriteViewModelDelegate?
    
    var favorites: [Favorites] = []
    
    private func fetchFavorites() {
        favorites = manager.fetchFavorites()
    }
    
    private func removeFavorites(favorite: Favorites) {
        manager.deleteFavorite(favorite: favorite)
    }
    
}

extension FavoriteViewModel: FavoriteViewModelProtocol {
    var numberOfItems: Int {
        favorites.count
    }
    
    func load() {
        fetchFavorites()
        delegate?.prepareCollectionView()
        delegate?.prepareViews()
        
    }
    
    func remove(favorite: Favorites) {
        removeFavorites(favorite: favorite)
    }
    
}
