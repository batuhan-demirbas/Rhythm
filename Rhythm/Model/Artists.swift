//
//  Artists.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

// MARK: - Artists
struct Artists: Codable {
    let data: [ArtistsDatum]
}

// MARK: - ArtistsDatum
struct ArtistsDatum: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type
    }
}
