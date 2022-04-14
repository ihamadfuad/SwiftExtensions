import Foundation

public struct Expirable<T> {

    private var innerValue: T
    private(set) var expirationDate: Date

    public var value: T? {
        return hasExpired() ? nil : innerValue
    }

    public init(value: T, expirationDate: Date) {

        innerValue = value
        self.expirationDate = expirationDate
    }

    public init(value: T, duration: Double) {

        innerValue = value
        expirationDate = Date().addingTimeInterval(duration)
    }

    public func hasExpired() -> Bool {

        expirationDate < Date()
    }
}
