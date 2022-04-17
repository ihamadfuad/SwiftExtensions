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

extension String: Error { }

extension String: LocalizedError {

    public var errorDescription: String? {
        return self
    }
}

public extension String {

    var words: [String] {

        components(separatedBy: .punctuationCharacters)
            .joined()
            .components(separatedBy: .whitespaces)
            .filter{!$0.isEmpty}
    }

    /// CamelCase of string.
    ///
    /// "hEllO woRlD".camelCased -> "helloWorld"
    ///
    var camelCased: String {

        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        return first + rest
    }

    func removingPrefix(_ prefix: String) -> String {

        guard hasPrefix(prefix)
        else {
            return self
        }
        
        return String(dropFirst(prefix.count))
    }

    func removingSuffix(_ suffix: String) -> String {

        guard hasSuffix(suffix)
        else {
            return self
        }

        return String(dropLast(suffix.count))
    }

    func withPrefix(_ prefix: String) -> String {

        guard !hasPrefix(prefix)
        else {
            return self
        }

        return prefix + self
    }
}
