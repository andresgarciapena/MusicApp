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
        
        viewRef?.configureView()
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
