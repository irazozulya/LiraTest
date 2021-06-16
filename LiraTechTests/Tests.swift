//
//  Tests.swift
//  LiraTechTests
//
//  Created by Ira Zozulya on 16.06.2021.
//

import XCTest
@testable import LiraTech

class Tests: XCTestCase {
    
    func testExample() throws {
        let mainPageManager = MainPageManager()
        
        mainPageManager.Quiz1[3].correct = 0;
        mainPageManager.Quiz1[0].correct = 3;
        
        XCTAssert(mainPageManager.Quiz1[3].correct == 0 && mainPageManager.Quiz1[0].correct == 3)
    }

    func testPerformanceExample() throws {
        let email = "Admin"
        let password = "123"
        
        let result1 = User.isAccessible(email: email, password: password)
        
        XCTAssert(result1)
    }
}
