//
//  ProductCollection.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class ProductCollection: NSObject {
    private(set) var products :[Product]
    
    override init() {
       self.products = []
       super.init()
    }
    
    func insert(product:Product) {
        self.products.append(product)
    }
    func insertProductAtIndex(product:Product, index:Int) {   //TODO: check the validity of the index.
        self.products.insert(product, atIndex: index)
    }
    
    func removeAtIndex(index:Int) -> Product? {
        if (self.isValidIndex(index)) {
            return self.products.removeAtIndex(index)
        }
        return nil
    }
    
    func removeProduct(product:Product) -> Product? {
        let productIndex:Int = self.indexOfProduct(product)
        if (self.isValidIndex(productIndex)) {
            return self.removeAtIndex(productIndex)
        }
        return nil
    }
    
    func productCount() -> Int {
        return self.products.count
    }
}

private extension ProductCollection {
    func isValidIndex(index:Int) -> Bool {
        if (index >= 0 && index < self.products.count) { // There was a bug that I had put index > 0 instead index >= 0
            return true
        }
        return false
    }
    // Rule Break:
    // Earlier I put this logic in removeProduct but it broke one level of indentation rule in method.But still here it breaks same rule.
    func indexOfProduct(findProduct:Product) -> Int {
        var index:Int = 0
        for product in self.products {
            if (findProduct == product) {
                break
            }
            index++
        }
        return index
    }
    
}

extension ProductCollection:Printable {
    override var description: String {
        return "products:\(self.products)"
    }
}

extension ProductCollection:SequenceType {
    func generate() -> GeneratorOf<Product> {
        var i = 0
        return GeneratorOf<Product> {
            if (i >= self.products.count) {
                return .None
            }
            return self.products[i++]
        }
    }
    
    func productAtIndex(index:Int) -> Product? {
        if (index >= self.products.count) {
            return .None
        }
        return self.products[index]
    }
}
