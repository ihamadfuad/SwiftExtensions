// ºººº----------------------------------------------------------------------ºººº \\
//
// Copyright (c) 2022 Hamad Fuad.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
// associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial
// portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
// NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
// THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// Author: Hamad Fuad
// Email: ihamadfouad@icloud.com
//
// Created At: 14/04/2022
// Last modified: 17/04/2022
//
// ºººº----------------------------------------------------------------------ºººº \\

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
