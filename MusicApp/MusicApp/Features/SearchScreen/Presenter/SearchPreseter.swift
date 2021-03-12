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
    
    func orderBySongLenght() {
        
        let order = viewRef?.searchResult?.sorted(by: { $0.trackTimeMillis! > $1.trackTimeMillis! })
        viewRef?.searchResult = order
        viewRef?.tableView.reloadData()
    }
    
    func orderByGenre() {

        let order = viewRef?.searchResult?.sorted(by: { $0.primaryGenreName > $1.primaryGenreName })
        viewRef?.searchResult = order
        viewRef?.tableView.reloadData()
    }
    
    func orderByPrice() {
        
        let order = viewRef?.searchResult?.sorted(by: { $0.trackPrice! > $1.trackPrice! })
        viewRef?.searchResult = order
        viewRef?.tableView.reloadData()
    }
    
    func navigationToPlayerView(searchResult: [ItunesSongInfo]?, position: Int) {
        
        guard let sourceController = viewRef else { return }
        router?.goToPlayerView(searchResult: searchResult, position: position, fromController: sourceController)
    }
}
