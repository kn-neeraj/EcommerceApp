//
//  CartClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

// Functionality - addProduct, deleteProduct,deleteProductAtIndex,totalPrice,productCount,

class CartClassTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddProductInCart() {
        let product:Product = Product(name: "product1", price: 121.0)
        Cart.sharedInstance.addProduct(product)
        let addedProduct = Cart.sharedInstance.productAtIndex(0)
        XCTAssertNotNil(addedProduct)
        if let uwAddedProduct = addedProduct {
            XCTAssertTrue(addedProduct == product, "Add product.")
        }
        Cart.sharedInstance.deleteProduct(product)
    }
    
    func testDeleteProduct() {
        let product:Product = Product(name: "product1", price: 121.0)
        Cart.sharedInstance.addProduct(product)
        let addedProduct = Cart.sharedInstance.productAtIndex(0)
        XCTAssertNotNil(addedProduct)
        if let uwAddedProduct = addedProduct {
            XCTAssertTrue(addedProduct == product, "Added product failed.")
        }
        Cart.sharedInstance.deleteProduct(product)
        let productCount = Cart.sharedInstance.products.productCount()
        XCTAssertTrue(productCount == 0, "Product Delete")
    }
    
    func testdeleteProductAtIndex() {
        let product:Product = Product(name: "product1", price: 121.0)
        Cart.sharedInstance.addProduct(product)
        let addedProduct = Cart.sharedInstance.productAtIndex(0)
        XCTAssertNotNil(addedProduct)
        if let uwAddedProduct = addedProduct {
            XCTAssertTrue(addedProduct == product, "Added product failed.")
        }
        Cart.sharedInstance.deleteProductAtIndex(0)
        let productCount = Cart.sharedInstance.products.productCount()
        XCTAssertTrue(productCount == 0, "Delete product at index")
    }
    
    func testTotalPrice() {
        let product:Product = Product(name: "product1", price: 121.0)
        Cart.sharedInstance.addProduct(product)
        let addedProduct = Cart.sharedInstance.productAtIndex(0)
        let productPrice = Cart.sharedInstance.totalPrice()
        XCTAssertTrue(productPrice == 121.0)
        Cart.sharedInstance.deleteProduct(product)
    }
    
    func testProductCount() {
        let product:Product = Product(name: "product1", price: 121.0)
        Cart.sharedInstance.addProduct(product)
        let productCount = Cart.sharedInstance.productsCount()
        XCTAssertTrue(productCount == 1, "Product count")
        Cart.sharedInstance.deleteProduct(product)
    }
}
