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
    
    private var _internalTimer: Timer?
    
    private var internalTimer: Timer? {
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
    
    private var _startDate: Date?
    
    private var startDate: Date? {
        get {
            return _startDate
        }
    }
    
    
    // MARK: Public methods
    
    public func start(withTimeInterval timeInterval: TimeInterval, repeats: Bool, block: @escaping ETTimerBlock) {
        // Stop internal timer if needed
        
        stop()
        
        
        // Initialize timer block
        
        _timerBlock = block
        
        
        // Initialize tick count
        
        _tickCount = 0
        
        
        // Initialize start date
        
        _startDate = Date()
        
        
        // Initialize internal timer
        
        _internalTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(ETTimer.internalTimerMethod), userInfo: nil, repeats: repeats)
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
    
    @objc
    internal func internalTimerMethod() {
        // Update tick count
        
        _tickCount! += 1
        
        
        // Obtain time interval since start
        
        let timeIntervalSinceStart = startDate == nil ? 0.0 : Date().timeIntervalSince(startDate!)
        
        
        // Start timer block
        
        timerBlock?(self, tickCount, timeIntervalSinceStart)
    }
    
    
    // MARK: Protocol methods
    
}
