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
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
