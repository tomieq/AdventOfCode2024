//
//  String+extension.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

extension String {
    func split(_ splitter: String) -> [String] {
        self.components(separatedBy: splitter)
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }

    subscript(safeIndex offset: Int) -> Character? {
        guard offset < self.count else {
            return nil
        }
        return self[index(startIndex, offsetBy: offset)]
    }

    subscript(range: Range<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return String(self[startIndex..<index(startIndex, offsetBy: range.count)])
    }

    subscript(range: ClosedRange<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return String(self[startIndex..<index(startIndex, offsetBy: range.count)])
    }

    subscript(range: PartialRangeFrom<Int>) -> String {
        String(self[index(startIndex, offsetBy: range.lowerBound)...])
    }

    subscript(range: PartialRangeThrough<Int>) -> String {
        String(self[...index(startIndex, offsetBy: range.upperBound)])
    }

    subscript(range: PartialRangeUpTo<Int>) -> String {
        String(self[..<index(startIndex, offsetBy: range.upperBound)])
    }
}

extension String {
    public func subString(_ from: Int, _ to: Int) -> String {
        if self.count < to {
            return self
        }

        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: to)

        let range = start..<end
        return String(self[range])
    }
}

extension String {
    func trimming(_ characters: String) -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: characters))
    }

    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    func removed(text: String) -> String {
        self.replacingOccurrences(of: text, with: "")
    }
}

extension String {
    var decimal: Int? {
        Int(decimal: self)
    }

    var binary: Int? {
        Int(binary: self)
    }

    var hex: Int? {
        Int(hex: self)
    }
}

extension String {
    func appendingRandomHexDigits(length: Int) -> String {
        let letters = "abcdef0123456789"
        let digits = String((0..<length).map{ _ in letters.randomElement()! })
        return self.appending(digits)
    }
}

extension String {
    var bytes: [UInt8] {
        return [UInt8](self.utf8)
    }
}

extension String {
    mutating func removeSubrange(_ range: ClosedRange<Int>) {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        self.removeSubrange(startIndex..<index(startIndex, offsetBy: range.count))
    }
}

extension String {
    var array: [String] {
        self.map{ String($0) }
    }

    var sorted: String {
        self.array.sorted().joined()
    }
}

extension String {
    var ascii: Int {
        Int(self[0].asciiValue!)
    }
}

extension String {
    // zwraca elementy wspólne dla tekstów
    func commonLetters(with other: String) -> String {
        self.array.commonElements(with: other.array).joined()
    }
}

extension String {
    // cuts the String into even parts
    func cut(into parts: Int) -> [String] {
        return self.array.cut(into: parts).map{ $0.joined() }
    }
}

extension String {
    mutating func append(_ other: String?) {
        guard let other = other else { return }
        self = self + other
    }
}

extension String {
    func chunked(by chunkSize: Int) -> [String] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            self.subString($0, Swift.min($0 + chunkSize, self.count))
        }
    }
}

extension String {
    var letterStatistics: Dictionary<String, Int> {
        var occuranceDict: [String : Int] = [:]
        for i in self {
            occuranceDict[i.string, default: 0].increment()
        }
        return occuranceDict
    }
}

extension String {
    func replaced(onlyFirst txt: String, with: String) -> String {
        if let range = self.range(of: txt) {
            return self.replacingCharacters(in: range, with: with)
        }
        return self
    }
}

extension String {
    func indexOf(_ searchString: String) -> Int? {
        guard let range = self.range(of: searchString) else {
            return nil
        }
        return self.distance(from: self.startIndex, to: range.lowerBound)
    }
}
