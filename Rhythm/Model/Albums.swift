//
//  Albums.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

// MARK: - Albums
struct Albums: Codable {
    let data: [Datum]
    let total: Int
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let title: String
    let link, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let genreID, fans: Int
    let releaseDate: String
    let recordType: String
    let tracklist: String
    let explicitLyrics: Bool
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case type
    }
}
