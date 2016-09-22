//
//  ETDispatcher.swift
//  Eternal
//
//  Created by Igor Matyushkin on 24.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

public class ETDispatcher: NSObject {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    @discardableResult
    public class func dispatch(onQueue queue: DispatchQueue, asynchronously runAsynchronously: Bool, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Start dispatch
        
        if runAsynchronously {
            queue.async {
                block()
            }
        } else {
            queue.sync {
                block()
            }
        }
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public class func dispatch(onQueue queue: DispatchQueue, asynchronously runAsynchronously: Bool, afterTimeInterval timeInterval: TimeInterval, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Start dispatch
        
        if timeInterval > 0.0 {
            let delayTime = DispatchTime(uptimeNanoseconds: UInt64(timeInterval * Double(NSEC_PER_SEC)))
            
            queue.asyncAfter(deadline: delayTime, execute: { 
                block()
            })
        }
        else {
            queue.async {
                block()
            }
        }
        
        
        // Return result
        
        return self
    }
    
    @discardableResult
    public class func dispatch(onBackgroundQueueAsynchronously runAsynchronously: Bool, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Obtain queue
        
        let queue = DispatchQueue.global(qos: .background)
        
        
        // Start dispatch
        
        dispatch(onQueue: queue, asynchronously: runAsynchronously) {
            block()
        }
        
        
        // Return result
        
        return self
    }

    @discardableResult
    public class func dispatch(onBackgroundQueueAfterTimeInterval timeInterval: TimeInterval, asynchronously runAsynchronously: Bool, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Obtain queue
        
        let queue = DispatchQueue.global(qos: .background)
        
        
        // Start dispatch
        
        dispatch(onQueue: queue, asynchronously: runAsynchronously, afterTimeInterval: timeInterval) {
            block()
        }
        
        
        // Return result
        
        return self
    }

    @discardableResult
    public class func dispatch(onMainQueueAsynchronously runAsynchronously: Bool, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Obtain queue
        
        let queue = DispatchQueue.main
        
        
        // Start dispatch
        
        dispatch(onQueue: queue, asynchronously: runAsynchronously) {
            block()
        }
        
        
        // Return result
        
        return self
    }

    @discardableResult
    public class func dispatch(onMainQueueAsynchronously runAsynchronously: Bool, afterTimeInterval timeInterval: TimeInterval, withBlock block: @escaping () -> Void) -> ETDispatcher.Type {
        // Obtain queue
        
        let queue = DispatchQueue.main
        
        
        // Start dispatch
        
        dispatch(onQueue: queue, asynchronously: runAsynchronously, afterTimeInterval: timeInterval) { 
            block()
        }
        
        
        // Return result
        
        return self
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
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
