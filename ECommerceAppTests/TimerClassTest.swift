//
//  TimerClassTest.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 28/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit
import XCTest

class TimerClassTest: XCTestCase {
    
    var timer:Timer! // implicit unwrapping
    var readyExpectation:XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let notificationCenter:NSNotificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: Selector("timerFired"), name: "com.app.notification.timerinvalidated", object: nil)
        self.timer = Timer(timerInterval: 3.0, repeat: false)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.timer.invalidate()
        self.timer = nil
    }

    
    func testTimer() {
        
        self.readyExpectation = expectationWithDescription("Expectation!!")
        XCTAssertTrue(self.timer.isValidTimer(), "Timer valid test")
        XCTAssertNotNil(self.timer.timerFireDate(), "Timer fire date")
        
        
        // Loop until the expectation is fulfilled
        waitForExpectationsWithTimeout(5.0, { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func timerFired() {
        self.readyExpectation.fulfill()
    }
    
}
