//
//  StatusCodeTest.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import XCTest
@testable import HTTeaPot

class StatusCodeTest: XCTestCase {

    // MARK: - Properties
    
    var sut: StatusCode!
    
    
    // MARK: - Test Properties
    
    let testCode: String = "418"
    let testTitle: String = "I'm a NOT teapot"
    let testDescription: String = "Test description"
    let testType: String = "4xx client error"
    let testSource: String = "RFC2324 Section 2.3.2"
    
    
    // MARK: - Set up and Tear down
    
    override func setUp() {
        super.setUp()
        sut = StatusCode(code: testCode, title: testTitle, description: testDescription, type: testType, source: testSource)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Test: Initialization
    
    func testInit_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_ShouldInitializeWithValues() {
        XCTAssertEqual(sut.code, testCode)
        XCTAssertEqual(sut.title, testTitle)
        XCTAssertEqual(sut.description, testDescription)
        XCTAssertEqual(sut.type, testType)
        XCTAssertEqual(sut.source, testSource)
    }

}
