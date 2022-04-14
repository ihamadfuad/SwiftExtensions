import Foundation

prefix operator ~>

prefix public func ~> <Element, Attribute>(_ keyPath: KeyPath<Element, Attribute>) -> (Element) -> Attribute {

    return { element in element[keyPath: keyPath] }
}
