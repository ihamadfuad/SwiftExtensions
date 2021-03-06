# SwiftExtensions

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![SPM compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Swift](https://img.shields.io/badge/Swift-5.6-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-13.3-blue.svg)](https://developer.apple.com/xcode)
 ![Issues](https://img.shields.io/github/issues/ihamadfuad/SwiftExtensions) 
 ![Releases](https://img.shields.io/github/v/release/ihamadfuad/SwiftExtensions)

# Sponsor
[![Sponsor](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/nuralme?country.x=BH&locale.x=en_US)

# SwiftExtensions

A Swift 5.6 implementation of native extensions for iOS, macOS, tvOS, watchOS.

## Installation
### Swift Package Manager (SPM)

You can use The Swift Package Manager to install SwiftExtensions by adding it to your Package.swift file:

    import PackageDescription

    let package = Package(
        name: "MyApp",
        targets: [],
        dependencies: [
            .Package(url: "https://github.com/ihamadfuad/SwiftExtensions.git", .from: "1.0.0")
        ]
    )
