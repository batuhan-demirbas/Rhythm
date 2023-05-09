//
//  Genre.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let data: [GenreDatum]
}

// MARK: - GenreDatum
struct GenreDatum: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case type
    }
}

enum TypeEnum: String, Codable {
    case genre = "genre"
    case artist = "artist"
}

