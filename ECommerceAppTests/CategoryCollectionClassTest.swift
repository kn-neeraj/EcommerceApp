//
//  CategoryCollectionClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

// Category Collection - initialization, insert,insertCategoryAtIndex,removeAtIndex,removeCategory, categoryCount

class CategoryCollectionClassTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        var categoryCollection:CategoryCollection = CategoryCollection()
        XCTAssertNotNil(categoryCollection, "Category collection is initialized")
    }
    
    func testInsertCategoryIntoCollection() {
         var categoryCollection:CategoryCollection = CategoryCollection()
        let category:Category = Category(name: "category1")
        categoryCollection.insertCategory(category)
        let currentCategories = categoryCollection.categories
        
        XCTAssertTrue(currentCategories.count == 1, "1 category is added")
        let addedCategory = currentCategories[0] as Category
        XCTAssertTrue(addedCategory.name == "category1", "Proper category added")
    }
    
    func testInsertCategoryAtIndexIntoCollection() {
        var categoryCollection:CategoryCollection = CategoryCollection()
        let category:Category = Category(name: "category1")
        categoryCollection.insertCategoryAtIndex(category, index: 0)
        let currentCategories = categoryCollection.categories
        XCTAssertTrue(currentCategories.count == 1, "1 category is added")
        
        let addedCategory = currentCategories[0] as Category
        XCTAssertTrue(addedCategory.name == "category1", "Proper category added")
    }
    
    func testCategoryCount() {
        var categoryCollection:CategoryCollection = CategoryCollection()
        XCTAssertTrue(categoryCollection.categoryCount() == 0, "Category count is correct")
        let category:Category = Category(name: "category1")
        categoryCollection.insertCategoryAtIndex(category, index: 0)
        XCTAssertTrue(categoryCollection.categoryCount() == 1, "Category count is correct")
    }
    
    func testRemoveCategoryAtIndexIntoCollection() {
         var categoryCollection:CategoryCollection = CategoryCollection()
         let category:Category = Category(name: "category1")
         categoryCollection.insertCategoryAtIndex(category, index: 0)
        XCTAssertNotNil(categoryCollection.removeCategoryAtIndex(0), "Remove at index passed.")
    }
    
    func testRemoveCategoryIntoCollection() {
        var categoryCollection:CategoryCollection = CategoryCollection()
        let category:Category = Category(name: "category1")
        categoryCollection.insertCategoryAtIndex(category, index: 0)
        XCTAssertNotNil(categoryCollection.removeCategory(category), "Remove passed.")
    }
}
