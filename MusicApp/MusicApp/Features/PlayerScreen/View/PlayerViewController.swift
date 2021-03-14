//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var presenter: PlayerPresenter = PlayerPresenter()
    
    var searchResult: [ItunesSongInfo]?
    var selectedResultPosition: Int = 0
    var state: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter.viewWillDisappear()
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        presenter.reproducePreviousSong()
    }
    
    @IBAction func playPauseButtonTapped(_ sender: Any) {
        presenter.playSong(state: state)
        state = !state
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        presenter.reproduceNextSong()
    }
    
    @IBAction func igButtonTapped(_ sender: Any) {
        
        presenter.publishIG()
    }
    
    @IBAction func twitterButtonTapped(_ sender: Any) {
        
        presenter.publishTwitter()
    }
}
