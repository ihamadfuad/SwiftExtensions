import Foundation

public extension Collection {

    var hasElements: Bool {

        !isEmpty
    }
}

public extension Collection {

    subscript (safe index: Index) -> Element? {

        indices.contains(index) ? self[index] : nil
    }
}
