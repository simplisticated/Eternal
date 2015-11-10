//
//  ETTimerExtensionInitialization.swift
//  Eternal
//
//  Created by Igor Matyushkin on 04.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension ETTimer {
    
    // MARK: Public class methods
    
    public class func every(timeInterval: NSTimeInterval, block: ETTimerBlock) -> ETTimer {
        // Obtain result timer
        
        let resultTimer = ETTimer()
        resultTimer.startWithTimeInterval(timeInterval, repeats: true, block: block)
        
        
        // Return result
        
        return resultTimer
    }
    
    public class func after(timeInterval: NSTimeInterval, block: ETTimerBlock) -> ETTimer {
        // Obtain result timer
        
        let resultTimer = ETTimer()
        resultTimer.startWithTimeInterval(timeInterval, repeats: false, block: block)
        
        
        // Return result
        
        return resultTimer
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}