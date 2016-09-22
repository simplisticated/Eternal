//
//  ETTimerBlock.swift
//  Eternal
//
//  Created by Igor Matyushkin on 04.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

public typealias ETTimerBlock = (_ timer: ETTimer, _ tickCount: Int, _ timeIntervalSinceStart: TimeInterval) -> Void

