//
//  HomeViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

class HomeViewModel {
    var isLoading: Bool = false
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
}
