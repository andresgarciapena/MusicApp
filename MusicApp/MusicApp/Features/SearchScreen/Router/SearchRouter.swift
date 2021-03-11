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
}

extension SearchRouter: SearchRouterProtocol {
    
}
