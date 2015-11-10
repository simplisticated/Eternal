<p align="center" >
  <img src="https://github.com/igormatyushkin014/Eternal/blob/master/Logo/logo-1024-300.png" alt="Eternal" title="Eternal">
</p>

# Eternal

The way to manage time in Swift.

##How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Eternal` cocoapod

## Requirements

* iOS 8 and later
* Xcode 7 and later

## Usage

```swift
/*
 * Create timer.
 */
let timer1 = ETTimer()


/*
 * Start timer with block.
 * On every call of block you will get number of ticks
 * and time interval which has gone from the start.
 */

timer1.startWithTimeInterval(1.0, repeats: true) { (timer, tickCount, timeIntervalSinceStart) -> Void in
    NSLog("Timer did tick %d times. %.0f seconds has gone from the launch.", tickCount, timeIntervalSinceStart)
}


/*
 * Example of timer which will tick one time only.
 */

timer1.startWithTimeInterval(1.0, repeats: false) { (timer, tickCount, timeIntervalSinceStart) -> Void in
    NSLog("Timer did tick")
}


/*
 * When you don't need timer to continue ticks,
 * call stop() method:
 */

timer1.stop()


/*
 * There's also a shortened form of timer creation:
 */

ETTimer.every(1.0) { (timer, tickCount, timeIntervalSinceStart) -> Void in
    // Do something every second
}


/*
 * Similar method for timer that will perform one time only:
 */

ETTimer.after(1.0) { (timer, tickCount, timeIntervalSinceStart) -> Void in
    // Do something one time
}

```

## License

`Eternal` is available under the MIT license. See the `LICENSE` file for more info.
