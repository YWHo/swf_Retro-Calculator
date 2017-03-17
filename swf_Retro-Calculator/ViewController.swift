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
    //var player: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation = CalcService.Operation.Empty
    var result: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(audioURL: AudioService.instance.btnUrl!)
        AudioService.instance.soundFXPlayer?.prepareToPlay()

    }

    @IBAction func numberPressed(btn: UIButton!) {
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividePressed(_ sender: UIButton) {
        processOperation(op: CalcService.Operation.Divide)
    }

    @IBAction func onMultiplyPressed(_ sender: UIButton) {
        processOperation(op: CalcService.Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(_ sender: UIButton) {
        processOperation(op: CalcService.Operation.Subtract)
    }

    @IBAction func onAddPressed(_ sender: UIButton) {
        processOperation(op: CalcService.Operation.Add)
    }
    
    @IBAction func onEqualPressed(_ sender: UIButton) {
        processOperation(op: currentOperation)
    }
    
    func processOperation(op: CalcService.Operation) {
        playSound()
        
        if currentOperation != CalcService.Operation.Empty {
            // Run some math
            
            // A user selected an operator, but then selected another
            // operator without first entering a number
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                
                if currentOperation == CalcService.Operation.Multiply {
                    result = CalcService.instance.multiply(numStrA: leftValStr, numStrB: rightValStr)
                } else if currentOperation == CalcService.Operation.Divide {
                    result = CalcService.instance.divide(numStrA: leftValStr, numStrB: rightValStr)
                } else if currentOperation == CalcService.Operation.Subtract {
                    result = CalcService.instance.subtract(numStrA: leftValStr, numStrB: rightValStr)
                } else if currentOperation == CalcService.Operation.Add {
                    result = CalcService.instance.add(numStrA: leftValStr, numStrB: rightValStr)
                }
                
                if let theResult = result {
                    leftValStr = theResult
                    outputLbl.text = theResult
                }

            }
            
            currentOperation = op
        } else {
            // This is the first time an operator has been pressed
            
            if runningNumber == "" {
                leftValStr = "0"
            } else {
                leftValStr = runningNumber
            }
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound() {
        _ = AudioService.instance.playCurrentSoundFX()
    }

    
}

