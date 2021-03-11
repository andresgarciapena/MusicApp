//
//  SearchPreseter.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchPresenter: SearchProtocol {
    
    var viewRef: SearchViewController?
    var router: SearchRouter?
    var interactor: SearchInteractor?
    
    func viewDidLoad() {
        
        SearchRouter.configureComponents(presenter: self)
        viewRef?.configureView()
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func getItunesResults(text: String) {
        
        let replacedText = text.replacingOccurrences(of: " ", with: "+")
        interactor?.getItunesResults(text: replacedText)
    }
    
    func returnResults(results: [ItunesSongInfo]) {
        
        viewRef?.searchResult = results
        viewRef?.tableView.reloadData()
    }
    
    func cleanTableResults() {
        
        viewRef?.searchResult = []
        viewRef?.tableView.reloadData()
    }
}
