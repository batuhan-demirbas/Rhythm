//
//  MusicPlaYER.swift
//  Rhythm
//
//  Created by Batuhan on 14.05.2023.
//

import AVFoundation

class AudioPlayer {
    var player: AVPlayer?

    func playAudio(from url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }
    
    func pauseAudio() {
        player?.pause()
    }
    
    func resumeAudio() {
        player?.play()
    }
}

