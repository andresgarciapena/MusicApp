//
//  SearchSongTableViewCell.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class SearchSongTableViewCell: UITableViewCell {

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var moreDetailsView: UIView!
    
    weak var delegate: SearchSongTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moreDetailsView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func detailsButtonTapped(_ sender: Any) {
        
        moreDetailsView.isHidden = !moreDetailsView.isHidden
        self.delegate?.updateTableView()
    }
    
}


