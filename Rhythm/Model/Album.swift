//
//  Album.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let id: Int
    let title: Title
    let upc: String
    let link, share, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: Md5Image
    let genreID: Int
    let genres: Genres
    let label: String
    let nbTracks, duration, fans: Int
    let releaseDate: String
    let recordType: RecordTypeEnum
    let available: Bool
    let tracklist: String
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let contributors: [Contributor]
    let artist: ArtistDetail
    let type: RecordTypeEnum
    let tracks: Tracks

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case genres, label
        case nbTracks = "nb_tracks"
        case duration, fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case available, tracklist
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case contributors, artist, type, tracks
    }
}

// MARK: - Artist
struct ArtistDetail: Codable {
    let id: Int
    let name: Name
    let picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let tracklist: String
    let type: ArtistType

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}

enum Name: String, Codable {
    case alternatif = "Alternatif"
    case duman = "Duman"
    case rock = "Rock"
}

enum ArtistType: String, Codable {
    case artist = "artist"
    case genre = "genre"
}

// MARK: - Contributor
struct Contributor: Codable {
    let id: Int
    let name: Name
    let link, share, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: ArtistType
    let role: String

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, role
    }
}

// MARK: - Genres
struct Genres: Codable {
    let data: [ArtistElement]
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int
    let name: Name
    let picture: String?
    let type: ArtistType
    let tracklist: String?
}

enum Md5Image: String, Codable {
    case the1Db1F372Ca79871772B51D0D09F4A1B5 = "1db1f372ca79871772b51d0d09f4a1b5"
}

enum Title: String, Codable {
    case darmaduman = "Darmaduman"
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int
    let readable: Bool
    let title, titleShort, titleVersion: String
    let link: String
    let duration, rank: Int
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let preview: String
    let md5Image: Md5Image
    let artist: ArtistElement
    let album: AlbumClass
    let type: PurpleType

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type
    }
}

// MARK: - AlbumClass
struct AlbumClass: Codable {
    let id: Int
    let title: Title
    let cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: Md5Image
    let tracklist: String
    let type: RecordTypeEnum

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
}

enum PurpleType: String, Codable {
    case track = "track"
}
