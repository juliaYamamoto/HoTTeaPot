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
    
    
    // MARK: - Test: Delegate
    
    func testDelegate_TableViewDelegate_ShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCodeTableView.delegate)
    }
    
    func testDelegate_TableViewDelegate_ShouldNotBeOfCorrectType() {
        XCTAssertTrue(sut.statusCodeTableView.delegate is StatusCodeViewController)
    }
    
    
    // MARK: - Test: Data Source
    
    func testDataSource_TableViewDataSource_ShouldNotBeNil() {
        XCTAssertNotNil(sut.statusCodeTableView.dataSource)
    }
    
    func testDataSource_TableViewDataSource_ShouldNotBeOfCorrectType() {
        XCTAssertTrue(sut.statusCodeTableView.dataSource is StatusCodeDataService)
    }
}
