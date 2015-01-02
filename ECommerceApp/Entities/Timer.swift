//
//  Timer.swift
//  ECommerceApp
//
//  Created by Neeraj Kumar on 25/12/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class Timer: NSObject {
   var mTimer:NSTimer?
    
    init(timerInterval:NSTimeInterval, repeat:Bool) {
        super.init()
         self.mTimer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: Selector("timerFired"), userInfo: nil, repeats: repeat)
    }
    
    func timerFired() {
        // fire a notification that cart will be invalidated.
        dispatch_async(dispatch_get_main_queue(), {
            let notificationCenter:NSNotificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName("com.app.notification.timerinvalidated", object: nil)
        });
    }
   
}

// Cart timer private interface.

private extension Timer {
    
    func invalidateTimer(timer:NSTimer) {
        if (timer.valid) {
            timer.invalidate()
        }
    }
    
}

// Cart timer internal interface.

extension Timer {
    func isValidTimer() -> Bool {
        if let uwTimer = self.mTimer {
            return uwTimer.valid
        }
        return false
    }
    
    func timerFireDate() -> NSDate? {
        if let timer = self.mTimer {
            return timer.fireDate
        }
        return nil
    }
    
    func invalidate() {
        if let uwTimer = self.mTimer {
            self.invalidateTimer(uwTimer)
        }
    }
    
}
