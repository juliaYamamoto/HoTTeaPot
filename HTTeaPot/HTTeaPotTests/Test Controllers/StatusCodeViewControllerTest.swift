//
//  StatusCodeViewControllerTest.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-20.
//

import XCTest
@testable import HTTeaPot

class StatusCodeViewControllerTest: XCTestCase {

    // MARK: - Properties
    
    var sut: StatusCodeViewController!
    
    
    // MARK: - Test Properties
    
    
    // MARK: - Set up and Tear down
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "StatusCode") as? StatusCodeViewController
        _ = sut.view
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Test: Initialization
    
    func testInit_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCodeTableView)
    }
    
    
    // MARK: - Test: Data Service
    
    func testDataService_TableViewDataSource_ShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCodeTableView.dataSource)
    }
    
    func testDataService_TableViewDataSource_ShouldNotBeOfCorrectType() {
        XCTAssertTrue(sut.statusCodeTableView.dataSource is StatusCodeDataService)
    }
    
    func testDataService_TableViewDelegate_ShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCodeTableView.delegate)
    }
    
    func testDataService_TableViewDelegate_ShouldNotBeOfCorrectType() {
        XCTAssertTrue(sut.statusCodeTableView.delegate is StatusCodeDataService)
    }
}
