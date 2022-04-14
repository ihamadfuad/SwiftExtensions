import Foundation

infix operator ??=: AssignmentPrecedence

public func && (lhs: Bool?, rhs: Bool?) -> Bool {

    switch (lhs, rhs) {
    case (false, _), (_, false):
        return false
    case let (unwrapLhs?, unwrapRhs?):
        return unwrapLhs && unwrapRhs
    default:
        return false
    }
}

public func || (lhs: Bool?, rhs: Bool?) -> Bool {

    switch (lhs, rhs) {
    case (true, _), (_, true):
        return true
    case let (unwrapLhs?, unwrapRhs?):
        return unwrapLhs || unwrapRhs
    default:
        return false
    }
}

public extension Optional {

    func unwrapped(or defaultValue: Wrapped) -> Wrapped {

        return self ?? defaultValue
    }

    /// Assign an optional value to a variable only if the value is not nil
    static func ??= (lhs: inout Optional, rhs: Optional) {
        guard let rhs = rhs else { return }
        lhs = rhs
    }
}

public extension Optional where Wrapped == String {

    var `default`: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }
}

extension Optional: Comparable where Wrapped: Comparable {

    public static func < (lhs: Optional, rhs: Optional) -> Bool {

        switch (lhs, rhs) {
        case let (lhs?, rhs?):
            return lhs < rhs
        case (nil, _?):
            return true // anything is greater than nil
        case (_?, nil):
            return false // nil in smaller than anything
        case (nil, nil):
            return true // nil is not smaller than itself
        }
    }
}
