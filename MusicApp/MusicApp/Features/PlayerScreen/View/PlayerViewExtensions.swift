//
//  PlayerViewExtensions.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

extension PlayerViewController {
    
    func configureView() {
        
        stackView.layer.cornerRadius = 5.0
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 1
        
        songNameLabel.text = searchResult?[selectedResultPosition].trackName
        artistLabel.text = searchResult?[selectedResultPosition].artistName
        descriptionLabel.text = searchResult?[selectedResultPosition].collectionName
        coverImage.image = urlToImage(urlString: (searchResult?[selectedResultPosition].artworkUrl100)!)
    }
}
