//
//  LiraTechUITests.swift
//  LiraTechUITests
//
//  Created by Ira Zozulya on 16.06.2021.
//

import XCTest
@testable import LiraTech

class LiraTechUITests: XCTestCase {
    func userTest() throws {
        let email = "Admin"
        let password = "123"
        
        let result = User.isAccessible(email: email, password: password)
        
        XCTAssert(result, "")
    }
}
