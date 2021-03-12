//
//  SearchInteractor.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchInteractor: SearchInteractorProtocol {
    
    var presenter: SearchPresenter?
    
    func orderResultsByType(orderType: OrderType, searchResult: [ItunesSongInfo]) -> [ItunesSongInfo] {
        var orderResults: [ItunesSongInfo] = []
        switch orderType {
        case .songLength:
            orderResults = searchResult.sorted(by: { $0.trackTimeMillis! > $1.trackTimeMillis! })
        case .genre:
            orderResults = searchResult.sorted(by: { $0.primaryGenreName > $1.primaryGenreName })
        case .price:
            orderResults = searchResult.sorted(by: { $0.trackPrice! > $1.trackPrice! })
        }
        return orderResults
    }
    
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
