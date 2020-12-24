//
//  ColorTest.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-24.
//

import XCTest
@testable import HTTeaPot

class ColorTest: XCTestCase {

    // MARK: - Set up and Tear down
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    //MARK: - Test: getColorNameForType
    
    func testGetColor_ShouldReturnColorName_ForEachType() {
        XCTAssertEqual(getColorNameForType(.informational), Constants.ColorName().purple)
        XCTAssertEqual(getColorNameForType(.success), Constants.ColorName().blue)
        XCTAssertEqual(getColorNameForType(.redirection), Constants.ColorName().green)
        XCTAssertEqual(getColorNameForType(.clientError), Constants.ColorName().red)
        XCTAssertEqual(getColorNameForType(.serverError), Constants.ColorName().yellow)
    }
    
}
