//
//  CardAtomTests.swift
//  UsersUITests
//
//  Created by Juan Camilo Marín Ochoa on 24/12/22.
//

import XCTest

final class CardAtomTest: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_cardAtom() {
        app.staticTexts["VIEW POSTS"].firstMatch.press(forDuration: 0.1)
    }
}
