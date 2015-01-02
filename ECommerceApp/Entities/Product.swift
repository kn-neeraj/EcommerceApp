//
//  Product.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class Product: NSObject {
    private(set) var productDetail:ProductDetail
    weak private(set) var categories:CategoryCollection?
    
    
    var name:String {
        return self.productDetail.name
    }
    
    var price:Double {
        return self.productDetail.price
    }
    
    init(name:String, price:Double) {
        self.productDetail = ProductDetail(id:NSUUID().UUIDString ,name:name, price:price)
        super.init()
    }
}

extension Product:Printable {
    override var description: String {
        return "categories:\(self.categories)"
    }
}

extension Product:Equatable {
}

func ==(lhs: Product, rhs: Product) -> Bool {
    // Instead of taking decision here ask producDetail to do it for you.
    if (lhs.productDetail == rhs.productDetail) {
        return true
    }
    return false
}