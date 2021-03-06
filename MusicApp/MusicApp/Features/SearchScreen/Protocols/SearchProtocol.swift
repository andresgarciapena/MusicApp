//
//  SearchProtocol.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

protocol SearchProtocol {
    
    var viewRef: SearchViewController? {get set}
    var router: SearchRouter? {get set}
    var interactor: SearchInteractor? {get set}
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?)
}

protocol SearchRouterProtocol {
    
    func goToPlayerView(searchResult: [ItunesSongInfo]?, position: Int, fromController: SearchViewController)
}

protocol SearchInteractorProtocol {
    
    var presenter: SearchPresenter? {get set}
    
    func getItunesResults(text: String)
}

protocol SearchSongTableViewCellDelegate: AnyObject {
    func updateTableView()
}
