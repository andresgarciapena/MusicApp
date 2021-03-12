//
//  PlayerProtocol.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

protocol PlayerProtocol {
    
    var viewRef: PlayerViewController? {get set}
    var router: PlayerRouter? {get set}
    var interactor: PlayerInteractor? {get set}
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?)
}

protocol PlayerRouterProtocol {
    
}

protocol PlayerInteractorProtocol {
    
    var presenter: PlayerPresenter? {get set}
}
