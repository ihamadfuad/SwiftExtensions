import Foundation

public extension Sequence where Element: Equatable {

    func removeDuplicates() -> [Element] {

        reduce([], { $0.contains($1) ? $0 : $0 + [$1] })
    }
}

public extension Sequence {

    func sorted<T: Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {

        sorted(by: { $0[keyPath: attribute] < $1[keyPath: attribute] })
    }
}

/**
 struct Person {
 var name: String
 var age: Int
 }

 let mike = Person(name: "Mike", age: 18)
 let john = Person(name: "John", age: 18)
 let bob = Person(name: "Bob", age: 56)
 let jake = Person(name: "Jake", age: 56)
 let roman = Person(name: "Roman", age: 25)

 let persons = [mike, john, bob, jake, roman]

 let groupedPersons = persons.group { $0.age }

 for persons in groupedPersons {
 print(persons.map { $0.name })
 }
 */
public extension Sequence {

    func group<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [[Iterator.Element]] {

        var groups: [GroupingType: [Iterator.Element]] = [:]
        var groupsOrder: [GroupingType] = []

        forEach { element in

            let key = key(element)

            if case nil = groups[key]?.append(element) {

                groups[key] = [element]
                groupsOrder.append(key)
            }
        }

        return groupsOrder.map { groups[$0]! }
    }
}

public extension Array where Element: Equatable {

    mutating func remove(_ object: Element) throws {

        if let index = firstIndex(of: object) {

            remove(at: index)

            return
        }

        throw "Object doesn't exist."
    }
}

public extension Array where Element: Hashable {

    func next(item: Element) -> Element? {

        if let index = firstIndex(of: item), indices.contains(index + 1) {

            return self[index + 1]
        }

        return nil
    }

    func previous(item: Element) -> Element? {

        if let index = firstIndex(of: item), indices.contains(index - 1) {

            return self[index - 1]
        }

        return nil
    }
}
