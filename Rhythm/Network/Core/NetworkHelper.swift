//
//  NetworkHelper.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidUrl = "invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    var baseURL = "https://api.deezer.com"
    
    func requestUrl(url: String) -> String {
        baseURL + url
    }
}
