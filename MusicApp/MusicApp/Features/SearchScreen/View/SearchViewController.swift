//
//  SearchViewController.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchPresenter = SearchPresenter()
    
    var textToSearch: String = ""
    var searchResult: [ItunesSongInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
}

