//
//  swf_Retro_CalculatorUITests.swift
//  swf_Retro-CalculatorUITests
//
//  Created by Brian Ho on 12/03/2017.
//  Copyright © 2017 Brian Ho. All rights reserved.
//

import XCTest

class swf_Retro_CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalc() {
        
        let app = XCUIApplication()
        
        let buttonFive = app.buttons["5"]
        buttonFive.tap()
        app.buttons["add"].tap()
        buttonFive.tap()
        
        let equalButton = app.buttons["equal"]
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["10.0"].exists)
        
        app.buttons["divide"].tap()
        app.buttons["2"].tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["5.0"].exists)
        
        app.buttons["multiply"].tap()
        buttonFive.tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["25.0"].exists)
        
        app.buttons["subtract"].tap()
        app.buttons["4"].tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["21.0"].exists)
    }
    
}
