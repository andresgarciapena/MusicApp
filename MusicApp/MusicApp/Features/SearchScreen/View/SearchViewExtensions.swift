//
//  SearchViewExtensions.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

extension SearchViewController {
    
    func configureView() {
        
        tableView.register(UINib(nibName: "SearchSongTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchSongTableViewCell")
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchSongTableViewCell", for: indexPath) as! SearchSongTableViewCell
        cell.songTitleLabel.text = "1"
        cell.artistNameLabel.text = "2"
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
}

extension SearchViewController: SearchSongTableViewCellDelegate {
    
    func updateTableView() {
        
        tableView.reloadData()
    }
}
