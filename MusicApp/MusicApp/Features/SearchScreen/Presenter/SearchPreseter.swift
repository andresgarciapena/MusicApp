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
        viewRef?.hideKeyboardWhenTapAnywhere()
        viewRef?.overrideUserInterfaceStyle = .light
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
    
    func orderResults(orderType: OrderType) {
        
        guard let results = viewRef?.searchResult else { return }
        let ordered = interactor?.orderResultsByType(orderType: orderType, searchResult: results)
        viewRef?.searchResult = ordered
        viewRef?.tableView.reloadData()
    }
    
    func navigationToPlayerView(searchResult: [ItunesSongInfo]?, position: Int) {
        
        guard let sourceController = viewRef else { return }
        router?.goToPlayerView(searchResult: searchResult, position: position, fromController: sourceController)
    }
}
