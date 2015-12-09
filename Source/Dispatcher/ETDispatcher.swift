//
//  ETDispatcher.swift
//  Eternal
//
//  Created by Igor Matyushkin on 24.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ETDispatcher: NSObject {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    public class func sharedDispatcher() -> ETDispatcher {
        struct Singleton {
            static var dispatcher = ETDispatcher()
        }
        
        return Singleton.dispatcher
    }
    
    
    // MARK: Initializers
    
    public override init() {
        super.init()
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public func dispatchOnQueue(queue: dispatch_queue_t, withBlock block: () -> Void) -> ETDispatcher {
        // Start dispatch
        
        dispatch_async(queue) { () -> Void in
            block()
        }
        
        
        // Return result
        
        return self
    }
    
    public func dispatchOnQueue(queue: dispatch_queue_t, afterTimeInterval timeInterval: NSTimeInterval, withBlock block: () -> Void) -> ETDispatcher {
        // Start dispatch
        
        if timeInterval > 0.0 {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(timeInterval * Double(NSEC_PER_SEC)))
            
            dispatch_after(delayTime, queue) { () -> Void in
                block()
            }
        }
        else {
            dispatch_async(queue) { () -> Void in
                block()
            }
        }
        
        
        // Return result
        
        return self
    }
    
    public func dispatchOnBackgroundQueueWithBlock(block: () -> Void) -> ETDispatcher {
        // Obtain queue
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        
        
        // Start dispatch
        
        dispatchOnQueue(queue, withBlock: block)
        
        
        // Return result
        
        return self
    }
    
    public func dispatchOnBackgroundQueueAfterTimeInterval(timeInterval: NSTimeInterval, withBlock block: () -> Void) -> ETDispatcher {
        // Obtain queue
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        
        
        // Start dispatch
        
        dispatchOnQueue(queue, afterTimeInterval: timeInterval) { () -> Void in
            block()
        }
        
        
        // Return result
        
        return self
    }
    
    public func dispatchOnMainQueueWithBlock(block: () -> Void) -> ETDispatcher {
        // Obtain queue
        
        let queue = dispatch_get_main_queue()
        
        
        // Start dispatch
        
        dispatchOnQueue(queue, withBlock: block)
        
        
        // Return result
        
        return self
    }
    
    public func dispatchOnMainQueueAfterTimeInterval(timeInterval: NSTimeInterval, withBlock block: () -> Void) -> ETDispatcher {
        // Obtain queue
        
        let queue = dispatch_get_main_queue()
        
        
        // Start dispatch
        
        dispatchOnQueue(queue, afterTimeInterval: timeInterval) { () -> Void in
            block()
        }
        
        
        // Return result
        
        return self
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
