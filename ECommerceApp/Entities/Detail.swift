//
//  Detail.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 18/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class Detail: NSObject {
    
    private let id:String
    private(set) var name:String
    
    init(id:String, name:String) {
        self.id = id
        self.name = name
        super.init()
    }
}

extension Detail:Printable {
   override var description: String {
       return "id:\(self.id), name:\(self.name)"
    }
}

extension Detail:Equatable {
}

func == (lhs: Detail, rhs: Detail) -> Bool {
    if (lhs.id == rhs.id) {
        return true
    }
    return false
}

