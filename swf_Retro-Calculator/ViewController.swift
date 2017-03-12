//
//  ViewController.swift
//  swf_Retro-Calculator
//
//  Created by Brian Ho on 12/03/2017.
//  Copyright © 2017 Brian Ho. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundUrl)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
    }

    @IBAction func onDividePressed(_ sender: UIButton) {
    }

    @IBAction func onMultiplyPressed(_ sender: UIButton) {
    }
    
    @IBAction func onSubtractPressed(_ sender: UIButton) {
    }

    @IBAction func onAddPressed(_ sender: UIButton) {
    }
    
    @IBAction func onEqualPressed(_ sender: UIButton) {
    }
    
    
}

