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
