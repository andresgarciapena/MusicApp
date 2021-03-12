//
//  SearchRouter.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchRouter {
    
    class func configureComponents(presenter: SearchPresenter) {
        
        presenter.router = SearchRouter()
        presenter.interactor = SearchInteractor()
        presenter.interactor?.presenter = presenter
    }
    
    func navigateToPlayerView(searchResult: [ItunesSongInfo]?, position: Int, classRef: UIViewController) {
        
        let vc = PlayerViewController(nibName: ViewIdentifier.playerVCId, bundle: nil)
        vc.searchResult = searchResult
        vc.selectedResultPosition = position
        guard let navigationController = classRef.navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
    }
}

extension SearchRouter: SearchRouterProtocol {
    
    func goToPlayerView(searchResult: [ItunesSongInfo]?, position: Int, fromController: SearchViewController) {
        
        navigateToPlayerView(searchResult: searchResult, position: position, classRef: fromController)
    }
}
