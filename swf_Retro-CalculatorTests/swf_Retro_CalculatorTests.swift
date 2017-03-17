//
//  swf_Retro_CalculatorTests.swift
//  swf_Retro-CalculatorTests
//
//  Created by Brian Ho on 12/03/2017.
//  Copyright © 2017 Brian Ho. All rights reserved.
//

import XCTest
@testable import swf_Retro_Calculator

class swf_Retro_CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAudioService() {
        
        XCTAssertNotNil(AudioService.instance)
        XCTAssertNotNil(AudioService.instance.pathForResource(filename: "btn", filetype: "wav"))
        XCTAssertNotNil(AudioService.instance.btnUrl)
        XCTAssertNil(AudioService.instance.createPlayerWithUrl(audioURL: URL(string: "a")!))
        XCTAssertNotNil(AudioService.instance.createPlayerWithUrl(audioURL: AudioService.instance.btnUrl!))
        XCTAssertNil(AudioService.instance.soundFXPlayer)
        XCTAssertFalse(AudioService.instance.playCurrentSoundFX())
        
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(audioURL: AudioService.instance.btnUrl!)
        XCTAssertNotNil(AudioService.instance.soundFXPlayer)
        XCTAssertTrue(AudioService.instance.playCurrentSoundFX())
    }
    
    func testCalcService() {
        XCTAssertNotNil(CalcService.instance)
        XCTAssertEqual(CalcService.Operation.Add.rawValue, "+", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.Divide.rawValue, "/", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.Empty.rawValue, "Empty", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.Multiply.rawValue, "*", "Incorrect Operator")
        XCTAssertEqual(CalcService.Operation.Subtract.rawValue, "-", "Incorrect Operator")
    }
    
    func testCalcServiceMultiply() {
        XCTAssertNil(CalcService.instance.multiply(numStrA: "dbe", numStrB: "kkm"))
        XCTAssertNotNil(CalcService.instance.multiply(numStrA: "10", numStrB: "15"))
        XCTAssertEqual(CalcService.instance.multiply(numStrA: "5", numStrB: "4"), "20.0")
        
    }
    
    func testCalcServiceDivide() {
        XCTAssertNil(CalcService.instance.divide(numStrA: "eef", numStrB: "llm"))
        XCTAssertNil(CalcService.instance.divide(numStrA: "9", numStrB: "0"))
        XCTAssertNotNil(CalcService.instance.divide(numStrA: "10", numStrB: "3"))
        XCTAssertEqual(CalcService.instance.divide(numStrA: "100", numStrB: "4"), "25.0")
    }
    
    func testCalcServiceAdd() {
        XCTAssertNil(CalcService.instance.add(numStrA: "edg", numStrB: "kkm"))
        XCTAssertNotNil(CalcService.instance.add(numStrA: "10", numStrB: "15"))
        XCTAssertEqual(CalcService.instance.add(numStrA: "5", numStrB: "4"), "9.0")
    }
    

    func testCalcServiceSubtract() {
        XCTAssertNil(CalcService.instance.subtract(numStrA: "gdfg", numStrB: "kkm"))
        XCTAssertNotNil(CalcService.instance.subtract(numStrA: "10", numStrB: "15"))
        XCTAssertEqual(CalcService.instance.subtract(numStrA: "25", numStrB: "4"), "21.0")
    }

}
