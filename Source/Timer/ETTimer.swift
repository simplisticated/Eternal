//
//  ETTimer.swift
//  Eternal
//
//  Created by Igor Matyushkin on 04.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

public class ETTimer: NSObject {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public override init() {
        super.init()
        
        
        // Initialize tick count
        
        _tickCount = 0
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _internalTimer: NSTimer?
    
    private var internalTimer: NSTimer? {
        get {
            return _internalTimer
        }
    }
    
    private var _timerBlock: ETTimerBlock?
    
    private var timerBlock: ETTimerBlock? {
        get {
            return _timerBlock
        }
    }
    
    private var _tickCount: Int!
    
    private var tickCount: Int {
        get {
            return _tickCount
        }
    }
    
    private var _startDate: NSDate?
    
    private var startDate: NSDate? {
        get {
            return _startDate
        }
    }
    
    
    // MARK: Public methods
    
    public func startWithTimeInterval(timeInterval: NSTimeInterval, repeats: Bool, block: ETTimerBlock) {
        // Stop internal timer if needed
        
        stop()
        
        
        // Initialize timer block
        
        _timerBlock = block
        
        
        // Initialize tick count
        
        _tickCount = 0
        
        
        // Initialize start date
        
        _startDate = NSDate()
        
        
        // Initialize internal timer
        
        _internalTimer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "internalTimerMethod", userInfo: nil, repeats: repeats)
    }
    
    public func stop() {
        // Stop and remove internal timer
        
        internalTimer?.invalidate()
        _internalTimer = nil
        
        
        // Remove timer block
        
        _timerBlock = nil
        
        
        // Reset tick count
        
        _tickCount = 0
        
        
        // Remove start date
        
        _startDate = nil
    }
    
    
    // MARK: Private methods
    
    internal func internalTimerMethod() {
        // Update tick count
        
        _tickCount!++
        
        
        // Obtain time interval since start
        
        let timeIntervalSinceStart = startDate == nil ? 0.0 : NSDate().timeIntervalSinceDate(startDate!)
        
        
        // Start timer block
        
        timerBlock?(timer: self, tickCount: tickCount, timeIntervalSinceStart: timeIntervalSinceStart)
    }
    
    
    // MARK: Protocol methods
    
}
