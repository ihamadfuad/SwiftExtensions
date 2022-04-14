import Foundation

@propertyWrapper
public struct History<Value> {

    private var value: Value
    private(set) var history: [Value] = []

    public init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    public var wrappedValue: Value {
        
        get { value }

        set {
            history.append(value)
            value = newValue
        }
    }

    public var projectedValue: Self {
        return self
    }
}
