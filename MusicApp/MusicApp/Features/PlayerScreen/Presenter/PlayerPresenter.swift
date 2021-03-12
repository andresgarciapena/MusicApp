//
//  PlayerPresenter.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import UIKit
import AVFoundation

class PlayerPresenter: PlayerProtocol {
    
    var viewRef: PlayerViewController?
    var router: PlayerRouter?
    var interactor: PlayerInteractor?
    
    var player: AVPlayer?
    
    func viewDidLoad() {
        
        PlayerRouter.configureComponents(presenter: self)
        viewRef?.configureView()
        viewRef?.hideKeyboardWhenTapAnywhere()
        viewRef?.overrideUserInterfaceStyle = .light
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func reproducePreviousSong() {
        
        if viewRef?.selectedResultPosition == 0 {
            viewRef?.selectedResultPosition = (viewRef?.searchResult!.count)! - 1
        } else {
            viewRef?.selectedResultPosition -= 1
        }
        viewRef?.configureView()
        viewRef?.state = true
        refreshPauseSong()
    }
    
    func playSong(state: Bool) {
        
        guard let position = viewRef?.selectedResultPosition, let actualSong = viewRef?.searchResult?[position] else { return }
        let url = URL(string: actualSong.previewUrl)!
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        if state {
            refreshPlaySong()
        } else {
            refreshPauseSong()
        }
    }
    
    func reproduceNextSong() {
        
        if viewRef?.searchResult?.count == viewRef?.selectedResultPosition {
            viewRef?.selectedResultPosition = 0
        } else {
            viewRef?.selectedResultPosition += 1
        }
        viewRef?.configureView()
        viewRef?.state = true
        refreshPauseSong()
    }
    
    private func refreshPlaySong() {
        
        player?.play()
        viewRef?.playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        viewRef?.playPauseButton.tintColor = .black
    }
    
    private func refreshPauseSong() {
        
        player?.pause()
        viewRef?.playPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
        viewRef?.playPauseButton.tintColor = .black
    }
    
    func publishIG() {
        
        let instagramUser = "instagram://user?username=andres"
        let instagramUrl = NSURL(string: instagramUser)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
            guard let url = URL(string: "http://instagram.com/") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    func publishTwitter() {
        
        let twitterUser = "twitter://user?username=andres"
        let twitterUrl = NSURL(string: twitterUser)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
            UIApplication.shared.open(twitterUrl! as URL)
        } else {
            guard let url = URL(string: "http://twitter.com/") else { return }
            UIApplication.shared.open(url)
        }
    }
}
