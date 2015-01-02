//
//  Cart.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 19/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

// TODO:Timer in Cart.
import UIKit

private let _sharedInstance = Cart()

class Cart: NSObject {
    
    var products:ProductCollection = ProductCollection()
    var cartTimer:Timer?
    
    
    class var sharedInstance : Cart {
        return _sharedInstance
    }
    
    func addProduct(product:Product) {
      Cart.sharedInstance.products.insert(product)
        // If a product is added then invalidate previous cart timer and create a new one.
        let isTimerValid:Bool? = self.cartTimer?.isValidTimer()
        if let uwIsTimerValid = isTimerValid {
            self.cartTimer?.invalidate()
        }
        self.cartTimer = Timer(timerInterval: 120.0, repeat:false)
    }
    
    func deleteProduct(product:Product) {
        Cart.sharedInstance.products.removeProduct(product)
        if (Cart.sharedInstance.products.productCount() == 0) {
            self.cartTimer?.invalidate()
        }
    }
    
    func deleteProductAtIndex(index:Int) {
        Cart.sharedInstance.products.removeAtIndex(index)
        if (Cart.sharedInstance.products.productCount() == 0) {
           self.cartTimer?.invalidate()
        }
    }
    
    func productAtIndex(index:Int) ->Product? {
        return self.products.productAtIndex(index)
    }
    
    func totalPrice() -> Double {
        var totalPrice:Double = 0.0
        for product in Cart.sharedInstance.products {
            totalPrice += product.price
        }
        return totalPrice
    }
    
    func productsCount() -> Int {
        return Cart.sharedInstance.products.productCount()
    }

}

extension Cart:Printable {
    override var description: String {
        return "products:\(self.products)"
    }
}
