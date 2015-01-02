//
//  ProductDetailClassTests.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

class ProductDetailClassTests: XCTestCase {

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
        let productDetail:ProductDetail = ProductDetail(id: "product id", name: "product name", price: 152.0)
        XCTAssertNotNil(productDetail, "detail is not nil")
        XCTAssert(productDetail.name == "product name" && productDetail.price == 152.0, "Detail class initialized properly.")
    }
    
    func testEquatable() {
        let productDetail:ProductDetail = ProductDetail(id: "product id", name: "product name", price: 152.0)
        let productDetail1:ProductDetail = ProductDetail(id: "product id", name: "product name", price: 152.0)
        let productDetail2:ProductDetail = ProductDetail(id: "product idabcd", name: "product name", price: 152.0)
        let productDetail3:ProductDetail = ProductDetail(id: "product id", name: "product namesdas", price: 153.0)
        
        XCTAssertTrue(productDetail == productDetail1, "Equatable test is successful")
        XCTAssertTrue(productDetail1 != productDetail2, "Equatable test is successful")
        XCTAssertTrue(productDetail1 == productDetail3, "Equatable test is successful")
    }
    
    // MARK: Negative test cases.
    
    func testNonEquatable() {
        let productDetail:ProductDetail = ProductDetail(id: "product id", name: "product name", price: 152.0)
        let productDetail1:ProductDetail = ProductDetail(id: "product idsadas", name: "product nameasd", price: 154.0)
        XCTAssertTrue(productDetail != productDetail1, "Non Equatable test is successful")
    }

    
}
