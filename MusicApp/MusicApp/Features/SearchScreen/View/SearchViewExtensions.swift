//
//  SearchViewExtensions.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

extension SearchViewController {
    
    func configureView() {
        
        searchBar.showsCancelButton = false
        tableView.register(UINib(nibName: ViewIdentifier.searchSongCellId, bundle: nil), forCellReuseIdentifier: ViewIdentifier.searchSongCellId)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let results = searchResult {
            return results.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifier.searchSongCellId, for: indexPath) as! SearchSongTableViewCell
        if let result = searchResult?[indexPath.row] {
            cell.setSongInformation(info: result)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.navigationToPlayerView(searchResult: searchResult, position: indexPath.row)
    }
}

extension SearchViewController: SearchSongTableViewCellDelegate {
    
    func updateTableView() {
        
        tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        textToSearch = searchText
    }
}
