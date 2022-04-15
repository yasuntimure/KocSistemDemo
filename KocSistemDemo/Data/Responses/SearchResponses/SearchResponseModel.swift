//
//  SearchResponseModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//
import Foundation

typealias SearchResponseModel = [Result]

// MARK: - Result
struct Result: Codable {
    let artworkUrl60: String?
    let collectionPrice: Double?
    let wrapperType: WrapperType?
    let country: Country?
    let isStreamable: Bool?
    let releaseDate: String?
    let artistID: Int?
    let collectionViewURL: String?
    let kind: Kind?
    let trackExplicitness: Explicitness?
    let currency: Currency?
    let artistName: String?
    let artistViewURL: String?
    let artworkUrl30: String?
    let trackViewURL: String?
    let discCount: Int?
    let collectionCensoredName: String?
    let collectionID: Int?
    let trackCensoredName: String?
    let previewURL: String?
    let trackTimeMillis: Int?
    let trackName: String?
    let trackPrice: Double?
    let collectionName: String?
    let artworkUrl100: String?
    let trackCount, trackID, discNumber: Int?
    let collectionExplicitness: Explicitness?
    let trackNumber: Int?
    let primaryGenreName: String?
    let trackRentalPrice, trackHDRentalPrice, collectionHDPrice: Double?
    let shortDescription, longDescription: String?
    let trackHDPrice: Double?
    let contentAdvisoryRating: String?
    let collectionArtistViewURL: String?
    let collectionArtistID: Int?
    let hasITunesExtras: Bool?
    let collectionArtistName: CollectionArtistName?

    enum CodingKeys: String, CodingKey {
        case artworkUrl60, collectionPrice, wrapperType, country, isStreamable, releaseDate
        case artistID = "artistId"
        case collectionViewURL = "collectionViewUrl"
        case kind, trackExplicitness, currency, artistName
        case artistViewURL = "artistViewUrl"
        case artworkUrl30
        case trackViewURL = "trackViewUrl"
        case discCount, collectionCensoredName
        case collectionID = "collectionId"
        case trackCensoredName
        case previewURL = "previewUrl"
        case trackTimeMillis, trackName, trackPrice, collectionName, artworkUrl100, trackCount
        case trackID = "trackId"
        case discNumber, collectionExplicitness, trackNumber, primaryGenreName, trackRentalPrice
        case trackHDRentalPrice = "trackHdRentalPrice"
        case collectionHDPrice = "collectionHdPrice"
        case shortDescription, longDescription
        case trackHDPrice = "trackHdPrice"
        case contentAdvisoryRating
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionArtistID = "collectionArtistId"
        case hasITunesExtras, collectionArtistName
    }
}

enum CollectionArtistName: String, Codable {
    case jackJohnson = "Jack Johnson"
}

enum Explicitness: String, Codable {
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
}

enum WrapperType: String, Codable {
    case track = "track"
}
