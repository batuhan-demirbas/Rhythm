//
//  FavoriteViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

class FavoriteViewModel {
    var isLoading: Bool = false
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
}
