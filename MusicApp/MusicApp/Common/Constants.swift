//
//  Constants.swift
//  MusicApp
//
//  Created by Andres Garcia on 12/03/2021.
//

import Foundation

struct Constants {
    
    static let apiUrl = "https://itunes.apple.com/search?media=music&term="
    
    static let igUrl = "http://instagram.com/"
    static let twitterUrl = "http://twitter.com/"
    
    static let priceFormat = "%.2f€"
    static let songDurationFormat = "%02i minutes %02i seconds"
}

struct ViewIdentifier {
    
    static let playerVCId = "PlayerViewController"
    static let searchSongCellId = "SearchSongTableViewCell"
}

enum OrderType {
    case songLength
    case genre
    case price
}
