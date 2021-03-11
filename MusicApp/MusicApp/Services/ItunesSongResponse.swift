//
//  ItunesSongResponse.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import Foundation

struct ItunesSongResponse: Decodable {
    
    let resultCount: Double
    let results: [ItunesSongInfo]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}

struct ItunesSongInfo: Decodable {
    
    let wrapperType: String
    let kind: String?
    let artistId: Int
    let collectionId: Int
    let trackId: Int?
    let artistName: String
    let collectionName: String
    let trackName: String?
    let collectionCensoredName: String
    let trackCensoredName: String?
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String?
    let previewUrl: String
    let artworkUrl30: String?
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let trackPrice: Double?
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String
    let currency: String
    let primaryGenreName: String
    let isStreamable: Bool?
    
    enum CodingKeys: CodingKey {
        case wrapperType
        case kind
        case artistId
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case collectionCensoredName
        case trackCensoredName
        case artistViewUrl
        case collectionViewUrl
        case trackViewUrl
        case previewUrl
        case artworkUrl30
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case trackPrice
        case releaseDate
        case collectionExplicitness
        case trackExplicitness
        case discCount
        case discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case country
        case currency
        case primaryGenreName
        case isStreamable
    }
}
