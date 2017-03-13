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
}
