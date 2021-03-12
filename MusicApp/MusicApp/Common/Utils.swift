//
//  Utils.swift
//  MusicApp
//
//  Created by Andres Garcia on 12/03/2021.
//

import UIKit

func urlToImage(urlString: String) -> UIImage {
    var imageToShow = UIImage()
    if let imageUrl = URL(string: urlString) {
        let imageData = try! Data(contentsOf: imageUrl)
        if let image = UIImage(data: imageData) {
            imageToShow = image
        }
    }
    return imageToShow
}
