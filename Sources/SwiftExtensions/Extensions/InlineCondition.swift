import Foundation

public func condition<T>(_ block: () -> T) -> T {

    block()
}
