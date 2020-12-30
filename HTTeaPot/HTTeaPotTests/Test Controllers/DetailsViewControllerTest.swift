//
//  DetailsViewControllerTest.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-30.
//

import XCTest
@testable import HTTeaPot

class DetailsViewControllerTest: XCTestCase {

    // MARK: - Properties
    
    var sut: DetailsViewController!
    
    
    // MARK: - Test Properties
    var statusCode: StatusCode!
    let testCode: String = "418"
    let testTitle: String = "I'm a NOT teapot"
    let testDescription: String = "Test description"
    let testType: String = "4xx client error"
    let testSource: String = "RFC2324 Section 2.3.2"
    
    // MARK: - Set up and Tear down
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "Details") as? DetailsViewController
        _ = sut.view
        
        statusCode = StatusCode(code: testCode, title: testTitle, description: testDescription, type: testType, source: testSource)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Test: Initialization
    
    func testInit_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }

    func testInit_IBOutlet_ShouldNotBeNil() {
        XCTAssertNotNil(sut.codeLabel)
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.typeLabel)
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertNotNil(sut.sourceLabel)
        XCTAssertNotNil(sut.okButton)
    }
    
    // MARK: - Test: setInformations
    
    func testSetInformations_ShouldSetCorrectInformations(){
        sut.setInformationsWith(statusCode)
        
        XCTAssertEqual(sut.codeLabel.text, testCode)
        XCTAssertEqual(sut.titleLabel.text, testTitle)
        XCTAssertEqual(sut.typeLabel.text, testType)
        XCTAssertEqual(sut.descriptionLabel.text, testDescription)
        XCTAssertEqual(sut.sourceLabel.text, testSource)
    }
}
