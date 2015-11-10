//
//  MainViewController.swift
//  EternalDemo
//
//  Created by Igor Matyushkin on 10.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
        timer.stop()
    }
    
    
    // MARK: Outlets
    
    @IBOutlet private weak var labelTime: UILabel!
    
    
    // MARK: Variables & properties
    
    private var timer: ETTimer!
    
    
    // MARK: Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Initialize navigation bar
        
        navigationItem.title = "Eternal Demo"
        
        
        // Initialize time label
        
        labelTime.text = ""
        
        
        // Initialize timer
        
        timer = ETTimer.every(1.0) { (timer, tickCount, timeIntervalSinceStart) -> Void in
            let textForLabelTime = String(format: "Timer: %d", arguments: [tickCount])
            self.labelTime.text = textForLabelTime
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
