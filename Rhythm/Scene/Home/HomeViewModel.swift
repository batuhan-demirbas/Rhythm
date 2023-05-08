//
//  HomeViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

class HomeViewModel {
    let manager = DeezerManager.shared
    
    var genre: Genre?
    
    var isLoading: Bool = false
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    func getGenre() {
        manager.getGenres() { [weak self] genre, error in
            guard let genre = genre else { return }
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.genre = genre
                self?.successCallback?()
            }
            
        }
    }
    
}
