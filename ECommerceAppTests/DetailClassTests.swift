//
//  DetailClassTests.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//


// Attributes of Details - id, name
// Behavior - Initialization, print,equatable (No need to test printable as it could be changed without tests failing.)

import UIKit
import XCTest

class DetailClassTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
// MARK: Positive test cases.
    
    func testDetailClassInitialization() {
        let detail:Detail = Detail(id: "Detail Id", name: "Detail name")
        XCTAssertNotNil(detail, "detail is not nil")
        XCTAssert(detail.name == "Detail name", "Detail class initialized properly.")
    }
    
    func testEquatable() {
        let detail:Detail = Detail(id: "Detail Id", name: "Detail name")
        let detail1:Detail = Detail(id: "Detail Id", name: "Detail name")
        let detail2:Detail = Detail(id: "Detail Id", name: "Detail nameasdasd") // id is same as detail1 but name is diff.
        let detail3:Detail = Detail(id: "Detail Idsdsd", name: "Detail name") // id is diff as detail1 but name is same
        XCTAssertTrue(detail == detail1, "Equatable test is successful")
        XCTAssertTrue(detail1 == detail2, "Equatable test is successful")
        XCTAssertTrue(detail1 != detail3, "Equatable test is successful")
    }
    
// MARK: Negative test cases.
    
    func testNonEquatable() {
        let detail:Detail = Detail(id: "Detail Id", name: "Detail name")
        let detail1:Detail = Detail(id: "Detail Idasdsa", name: "Detail name")
        XCTAssertTrue(detail != detail1, "Non Equatable test is successful")
    }
    
}
