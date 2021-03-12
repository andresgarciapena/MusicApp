//
//  PlayerRouter.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class PlayerRouter {
    
    class func configureComponents(presenter: PlayerPresenter) {
        
        presenter.router = PlayerRouter()
        presenter.interactor = PlayerInteractor()
        presenter.interactor?.presenter = presenter
    }
}

extension PlayerRouter: PlayerRouterProtocol {
    
}
