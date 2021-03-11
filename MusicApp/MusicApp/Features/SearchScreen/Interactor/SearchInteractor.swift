//
//  SearchInteractor.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchInteractor: SearchInteractorProtocol {
    
    var presenter: SearchPresenter?
    
    func getItunesResults(text: String) {
        
        SearchItunesServiceManager.sharedService.requestMusicList(text: text, completion: {(response, error) -> Void in
            
            DispatchQueue.main.async {
                if let results = response?.results {
                    self.presenter?.returnResults(results: results)
                }
            }
        })
    }
}
