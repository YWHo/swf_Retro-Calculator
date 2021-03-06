//
//  AudioService.swift
//  swf_Retro-Calculator
//
//  Created by Brian Ho on 13/03/2017.
//  Copyright © 2017 Brian Ho. All rights reserved.
//

import UIKit
import AVFoundation

class AudioService {
    static let instance = AudioService()  // Singleton
    
    private var _soundFXPlayer: AVAudioPlayer?
    
    var soundFXPlayer: AVAudioPlayer? {
        get {
            return _soundFXPlayer
        }
        set {
            _soundFXPlayer = newValue
        }
    }
    
    var btnUrl: URL? {
        if let urlStr = pathForResource(filename: "btn", filetype: "wav") {
            return URL(string: urlStr)
        }
        
        return nil
    }
    
    func pathForResource(filename: String, filetype: String) -> String? {
        return Bundle.main.path(forResource: filename, ofType: filetype)
    }

    func createPlayerWithUrl(audioURL: URL) -> AVAudioPlayer? {
        do {
            return try AVAudioPlayer(contentsOf: audioURL)
        } catch let err as NSError {
            print(err.debugDescription)
            return nil
        }
    }

    func playCurrentSoundFX() -> Bool {
        if let player = soundFXPlayer {
            if player.isPlaying {
                player.stop()
            }
            
            player.play()
            
            return player.isPlaying
        }
        
        return false    // means cannot play
    }
    
    
}
