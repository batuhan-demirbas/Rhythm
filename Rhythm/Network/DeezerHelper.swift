//
//  DeezerHelper.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

enum DeezerEndpoint: String {
    case genre = "/genre/"
    case artist = "/artist/"
    case album = "/album/"
    
    var path: String {
        switch self {
        case .genre:
            return NetworkHelper.shared.requestUrl(url: DeezerEndpoint.genre.rawValue)
        case .artist:
            return NetworkHelper.shared.requestUrl(url: DeezerEndpoint.artist.rawValue)
        case .album:
            return NetworkHelper.shared.requestUrl(url: DeezerEndpoint.album.rawValue)
        }
    }
}
