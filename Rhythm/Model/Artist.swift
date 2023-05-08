//
//  Artist.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

// MARK: - Artist
struct Artist: Codable {
    let id: Int
    let name: String
    let link, share, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let nbAlbum, nbFan: Int
    let radio: Bool
    let tracklist: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case nbAlbum = "nb_album"
        case nbFan = "nb_fan"
        case radio, tracklist, type
    }
}

