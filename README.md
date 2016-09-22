<p align="center" >
  <img src="https://github.com/igormatyushkin014/Eternal/blob/master/Logo/logo-1024-300.png" alt="Eternal" title="Eternal">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Eternal.svg?maxAge=2592000"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Eternal.svg?maxAge=2592000"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# Eternal

The way to manage time in Swift.

##How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `At a Glance` cocoapod

## Requirements

* iOS 9.0 and later
* Xcode 8 and later

**Note**: For Swift 2.x use `Eternal v1.1`. For Swift 3.0 use `Eternal v3.0`.

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
