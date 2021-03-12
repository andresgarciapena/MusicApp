//
//  PlayerInteractor.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class PlayerInteractor: PlayerInteractorProtocol {
    
    var presenter: PlayerPresenter?
    
    func publishSongIG() {
        
        let instagramUser = "instagram://user?username=andres"
        let instagramUrl = NSURL(string: instagramUser)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
            guard let url = URL(string: Constants.igUrl) else { return }
            UIApplication.shared.open(url)
        }
    }
    
    func publishSongTwitter() {
        
        let twitterUser = "twitter://user?username=andres"
        let twitterUrl = NSURL(string: twitterUser)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
            UIApplication.shared.open(twitterUrl! as URL)
        } else {
            guard let url = URL(string: Constants.twitterUrl) else { return }
            UIApplication.shared.open(url)
        }
    }
}
