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
    
    func viewWillDisappear() {
        
        playSong(state: false)
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
        
        interactor?.publishSongIG()
    }
    
    func publishTwitter() {
        
        interactor?.publishSongTwitter()
    }
}
