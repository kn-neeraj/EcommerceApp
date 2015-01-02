//
//  CategoryCollection.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class CategoryCollection: NSObject {
    private(set) var categories :[Category]
    
    override init() {
        self.categories = []
        super.init()
    }
    
    func insertCategory(category:Category) {
        self.categories.append(category)
    }
    func insertCategoryAtIndex(category:Category, index:Int) {
        self.categories.insert(category, atIndex: index)
    }
    
    func removeCategoryAtIndex(index:Int) -> Category? {
        if (self.isValidIndex(index)) {
            return self.categories.removeAtIndex(index)
        }
        return nil
    }
    
    func removeCategory(category:Category) -> Category? {
        let categoryIndex:Int = self.indexOfCategory(category)
        if (self.isValidIndex(categoryIndex)) {
            return self.removeCategoryAtIndex(categoryIndex)
        }
        return nil
    }
    
    func categoryCount() -> Int {
        return self.categories.count
    }
}

private extension CategoryCollection {
    
    func isValidIndex(index:Int) -> Bool {
        if (index >= 0 && index < self.categories.count) {
            return true
        }
        return false
    }
    
    // Rule Break:
    // Earlier I put this logic in removeProduct but it broke one level of indentation rule in method.But still here it breaks same rule.
    func indexOfCategory(findCategory:Category) -> Int {
        var index:Int = 0
        for category in self.categories {
            if (findCategory == category) {
                break
            }
            index++
        }
        return index
    }
}


extension CategoryCollection:Printable {
    override var description: String {
        return "categories:\(self.categories)"
    }
}

