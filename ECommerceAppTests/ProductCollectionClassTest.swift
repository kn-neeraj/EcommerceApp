//
//  ProductCollectionClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

// Product Collection - initialization, insert,insertProductAtIndex,removeAtIndex,removeProduct, productCount,Loop through a product like any other sequence

class ProductCollectionClassTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        var productCollection:ProductCollection = ProductCollection()
        XCTAssertNotNil(productCollection, "Product collection is initialized")
    }
    
    func testInsertProductIntoCollection() {
        var productCollection:ProductCollection = ProductCollection()
        let product:Product = Product(name: "Dummy product", price: 123.0)
        productCollection.insert(product) // Not sure how to test without involving any method yet to be tested?
        let currentProducts = productCollection.products
        XCTAssertTrue(currentProducts.count == 1, "1 product is added")
        
        let addedProduct = currentProducts[0] as Product
        XCTAssertTrue(addedProduct.name == "Dummy product" && addedProduct.price == 123.0, "Proper product added")
    }
    
    func testInsertProductAtIndexIntoCollection() {
         var productCollection:ProductCollection = ProductCollection()
        let product:Product = Product(name: "Dummy product1", price: 124.0)
        productCollection.insertProductAtIndex(product, index: 0) // Not sure how to test without involving any method yet to be tested?
        let currentProducts = productCollection.products
        XCTAssertTrue(currentProducts.count == 1, "1 product is added")
        
        let addedProduct = currentProducts[0] as Product
        XCTAssertTrue(addedProduct.name == "Dummy product1" && addedProduct.price == 124.0, "Proper product added")
    }
    
    func testProductCount() {
         var productCollection:ProductCollection = ProductCollection()
        XCTAssertTrue(productCollection.productCount() == 0, "Product count is correct")
        let product:Product = Product(name: "Dummy product1", price: 124.0)
        productCollection.insertProductAtIndex(product, index: 0)
        XCTAssertTrue(productCollection.productCount() == 1, "Product count is correct")
    }
    
    func testRemoveProductAtIndexIntoCollection() {
         var productCollection:ProductCollection = ProductCollection()
        let product:Product = Product(name: "Dummy product1", price: 124.0)
        productCollection.insertProductAtIndex(product, index: 0)
       XCTAssertNotNil(productCollection.removeAtIndex(0), "Remove at index passed.")
    }
    
    func testRemoveProductIntoCollection() {
        var productCollection:ProductCollection = ProductCollection()
        let product:Product = Product(name: "Dummy product", price: 123.0)
        productCollection.insert(product)
        XCTAssertNotNil(productCollection.removeProduct(product), "Remove passed.")
    }
    
    func testSequenceBehavior() {
         var productCollection:ProductCollection = ProductCollection()
        // By this test product collection has 0 products.
        let product:Product = Product(name: "Dummy product", price: 123.0)
        productCollection.insert(product)
        var count:Int = 0
        for product in productCollection.products {
            count++
        }
        XCTAssertTrue(count == 1, "Sequence works.")
    }
}
