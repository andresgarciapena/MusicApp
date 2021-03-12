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
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    weak var delegate: SearchSongTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moreDetailsView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSongInformation(info: ItunesSongInfo) {
        songTitleLabel.text = info.trackName
        artistNameLabel.text = info.artistName
        albumLabel.text = info.collectionName
        dateLabel.text = info.releaseDate
        coverImageView.image = urlToImage(urlString: info.artworkUrl100)
        lengthLabel.text = timeFormattedString(time: TimeInterval(info.trackTimeMillis!))
        genreLabel.text = info.primaryGenreName
        priceLabel.text = String(format: "%.2f€", info.trackPrice!)
    }
    
    func timeFormattedString(time: TimeInterval) -> String {
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        return String(format: "%02i minutes %02i seconds", minute, second)
    }
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
        
        moreDetailsView.isHidden = !moreDetailsView.isHidden
        self.delegate?.updateTableView()
    }
}


