//
//  AllStatusCodeTest.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import XCTest
@testable import HTTeaPot

class AllStatusCodeTest: XCTestCase {

    // MARK: - Properties
    
    var sut: AllStatusCode!
    
    
    // MARK: - Test Properties
    
    let numberOfelements: Int = 10
    let numberOfelementsOfTypeInformational: Int = 3
    let numberOfelementsOfTypeSuccess: Int = 3
    let numberOfelementsOfTypeRedirection: Int = 1
    let numberOfelementsOfTypeClientError: Int = 2
    let numberOfelementsOfTypeServerError: Int = 1
    
    
    // MARK: - Set up and Tear down
    
    override func setUp() {
        super.setUp()
        sut = fakeAllStatusCode
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Test: Initialization
    
    func testInit_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_StatusCodeArrayShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCode)
    }
    
    func testInit_ShouldInitializeWithCorrectCount_ForElements() {
        XCTAssertEqual(sut.statusCode.count, numberOfelements)
    }
    
    
    // MARK: - Test: getAllOfType
    
    func testType_ShouldGetCorrectCount_ForElementsOfTypeInformational() {
        XCTAssertEqual(sut.getAllOfType("1xx informational").count, numberOfelementsOfTypeInformational)
    }
    
    func testType_ShouldGetCorrectCount_ForElementsOfTypeSuccess() {
        XCTAssertEqual(sut.getAllOfType("2xx success").count, numberOfelementsOfTypeSuccess)
    }
    
    func testType_ShouldGetCorrectCount_ForElementsOfTypeRedirection() {
        XCTAssertEqual(sut.getAllOfType("3xx redirection").count, numberOfelementsOfTypeRedirection)
    }
    
    func testType_ShouldGetCorrectCount_ForElementsOfTypeClientError() {
        XCTAssertEqual(sut.getAllOfType("4xx client error").count, numberOfelementsOfTypeClientError)
    }
    
    func testType_ShouldGetCorrectCount_ForElementsOfTypeServerError() {
        XCTAssertEqual(sut.getAllOfType("5xx server error").count, numberOfelementsOfTypeServerError)
    }
}
