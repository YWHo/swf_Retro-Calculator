//
//  CalcService.swift
//  swf_Retro-Calculator
//
//  Created by Brian Ho on 13/03/2017.
//  Copyright © 2017 Brian Ho. All rights reserved.
//

import UIKit

class CalcService {
    static let instance = CalcService() // Singleton
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    func multiply(numStrA: String, numStrB: String) -> String? {
        if let numA = Double(numStrA), let numB = Double(numStrB) {
            return "\(numA * numB)"
        } else {
            return nil
        }
    }
    
    func divide(numStrA: String, numStrB: String) -> String? {
        if let numA = Double(numStrA), let numB = Double(numStrB) {
            if numB == 0 {
                return nil
            } else {
                return "\(numA / numB)"
            }
        } else {
            return nil
        }
    }
    
    func add(numStrA: String, numStrB: String) -> String? {
        if let numA = Double(numStrA), let numB = Double(numStrB) {
            return "\(numA + numB)"
        } else {
            return nil
        }
    }
    
    func subtract(numStrA: String, numStrB: String) -> String? {
        if let numA = Double(numStrA), let numB = Double(numStrB) {
            return "\(numA - numB)"
        } else {
            return nil
        }
    }
    
}
