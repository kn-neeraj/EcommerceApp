//
//  CategoryClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

class CategoryClassTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCategoryClassInitialization() {
        let category:Category = Category(name: "Category1")
        XCTAssertNotNil(category, "product is not nil")
        XCTAssert(category.name == "Category1", "Category class initialized properly.")
    }
    
    func testEquatable() {
         let category:Category = Category(name: "Category1")
         let category1:Category = Category(name: "Category2")
        // Two products are different even with same name and price because id is different.
        XCTAssertTrue(category != category1, "Equatable test is successful")
    }
    

    
}
