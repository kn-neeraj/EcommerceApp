//
//  Category.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class Category: NSObject {
    private(set) var detail:Detail
    private(set) var products:ProductCollection?
    private(set) var subCategories:CategoryCollection?// Breaking rule of having not more than two instances in a class.
    
    init(name:String) {
        self.detail = Detail(id:NSUUID().UUIDString ,name:name)
        super.init()
    }
    
    var name:String {
        return self.detail.name
    }
}

extension Category:Printable {
    override var description: String {
        return "detail:\(self.detail), products:\(self.products)"
    }
}

//MARK: Subcategory support.

extension Category {
    func insertSubcategory(category:Category) {
        self.subCategories?.insertCategory(category)
    }
    func insertSubCategoryAtIndex(category:Category, index:Int) {
        self.subCategories?.insertCategoryAtIndex(category, index: index)
    }
    
    func removeSubCategoryAtIndex(index:Int) {
        self.subCategories?.removeCategoryAtIndex(index)
    }
    
    func removeCategory(category:Category) {
        self.subCategories?.removeCategory(category)
    }
}


extension Category:Equatable {
}

func ==(lhs: Category, rhs: Category) -> Bool {
    // Instead of taking decision here ask producDetail to do it for you.
    if (lhs.detail == rhs.detail) {
        return true
    }
    return false
}