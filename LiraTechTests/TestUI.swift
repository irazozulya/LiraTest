//
//  TestUI.swift
//  LiraTechUITests
//
//  Created by Lulu on 16.06.2021.
//

import XCTest


class TestUI: XCTestCase {

    override func setUpWithError() throws {
 
        continueAfterFailure = false
        XCUIApplication().launch()


    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.staticTexts["Вхід у кабінет студента"].exists)

    }

}
