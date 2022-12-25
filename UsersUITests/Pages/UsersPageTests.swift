//
//  UsersSearchTests.swift
//  UsersUITests
//
//  Created by Juan Camilo Marín Ochoa on 24/12/22.
//

import XCTest

final class UsersPageTests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func test_fieldSearch() {
        let searchField = app.textFields["Search"]
        XCTAssertTrue(searchField.exists)
        
        searchField.tap()
        searchField.typeText("Ervin Howell")
    }
    
    func test_complex() {
        app.swipeUp()
        app.swipeDown()
        
        let searchField = app.textFields["Search"]
        XCTAssertTrue(searchField.exists)
        
        searchField.tap()
        searchField.typeText("Glenna")
        
        app.staticTexts["VIEW POSTS"].firstMatch.press(forDuration: 0.1)
    }
}
