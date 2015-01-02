//
//  ProductDetail.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class ProductDetail: NSObject {
    private var detail:Detail // Instead of user asking product.detail.name it should as product.name
    private(set) var price:Double
    
    var name:String {
        return self.detail.name
    }
    
    init(id:String, name:String, price:Double) {
        self.detail = Detail(id: id, name: name)
        self.price = price
       super.init()
    }
    
}

extension ProductDetail:Printable {
    override var description: String {
        return "detail:\(self.detail), price:\(self.price)"
    }
}

extension ProductDetail:Equatable {
}

func == (lhs: ProductDetail, rhs: ProductDetail) -> Bool {
    // Instead of taking decision here ask Detail to do it for you.
    if (lhs.detail == rhs.detail) {
        return true
    }
    return false
}
