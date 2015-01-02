//
//  ProductClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

class ProductClassTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // MARK: Positive test cases.
    
    func testProductClassInitialization() {
        let product:Product = Product(name: "product1", price: 121.0)
        XCTAssertNotNil(product, "product is not nil")
        XCTAssert(product.name == "product1" && product.price == 121.0, "Product class initialized properly.")
    }
    
    func testEquatable() {
        let product:Product = Product(name: "product1", price: 121.0)
        let product1:Product = Product(name: "product1", price: 121.0)
        // Two products are different even with same name and price because id is different.
        XCTAssertTrue(product != product1, "Equatable test is successful")
    }

}
