//
//  TableViewTest.swift
//  TableViewTest
//
//  Created by pratap surendran ganesan on 27/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import XCTest

class TableViewTest: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       app = XCUIApplication()
       app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchTableView() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Search"].tap()
        XCTAssertEqual(app.tables.count,1)
        XCTAssertEqual(app.tables.cells.count,10)
        app.tables.staticTexts["Annabelle"].tap()
        app.navigationBars["iMovie.ShowDetailView"].buttons["Search"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
