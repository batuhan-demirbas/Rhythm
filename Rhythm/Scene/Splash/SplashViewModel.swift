//
//  SplashViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 12.05.2023.
//

import Foundation

protocol SplashViewModelDelegate: AnyObject {
    func showHome()
}

protocol SplashViewModelProtocol {
    var delegate: SplashViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var genres: [GenreDatum] { get }
    func load()
}

final class SplashViewModel {
    let manager = DeezerManager.shared
    weak var delegate: SplashViewModelDelegate?
    var genres: [GenreDatum] = []
    
    var isLoading: Bool = false
    var errorCallback: ((String) -> Void)?
    var successCallback: (() -> Void)?
    
    private func fetchGenres() {
        manager.getGenres { [weak self] result, error in
            guard let result = result else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.genres = result.data
                self?.delegate?.showHome()
                self?.successCallback?()
            }
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    
    var numberOfItems: Int {
        genres.count
    }
    
    func load() {
        fetchGenres()
    }
}
