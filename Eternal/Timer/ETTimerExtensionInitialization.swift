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
    
    public class func every(timeInterval: TimeInterval, block: @escaping ETTimerBlock) -> ETTimer {
        // Obtain result timer
        
        let resultTimer = ETTimer()
        resultTimer.start(withTimeInterval: timeInterval, repeats: true, block: block)
        
        
        // Return result
        
        return resultTimer
    }
    
    public class func after(timeInterval: TimeInterval, block: @escaping ETTimerBlock) -> ETTimer {
        // Obtain result timer
        
        let resultTimer = ETTimer()
        resultTimer.start(withTimeInterval: timeInterval, repeats: false, block: block)
        
        
        // Return result
        
        return resultTimer
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}
