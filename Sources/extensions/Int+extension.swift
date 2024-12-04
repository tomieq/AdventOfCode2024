//
//  Int+extension.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

extension Int {
    var hex: String {
        String(self, radix: 16)
    }

    var binary: String {
        String(self, radix: 2)
    }

    var decimal: String {
        String(self, radix: 10)
    }
}

extension Int {
    init?(decimal: String) {
        self.init(decimal, radix: 10)
    }

    init?(binary: String) {
        self.init(binary, radix: 2)
    }

    init?(hex: String) {
        self.init(hex, radix: 16)
    }
}

extension Int {
    mutating func increment() {
        self += 1
    }

    mutating func decrement() {
        self -= 1
    }
}

extension Int {
    var incremented: Int {
        self + 1
    }

    var decremented: Int {
        self - 1
    }
}

extension Int {
    func greatestCommonDivisor(with other: Int) -> Int {
        var x = 0
        // Finding maximum number
        var y = Swift.max(self, other)
        // Finding minimum number
        var z = Swift.min(self, other)

        while z != 0 {
           x = y
           y = z
           z = x % y
        }
        return y
    }

    // the smallest common multiple between two or more numbers
    func leastCommonMultiple(with other: Int) -> Int {
        self * other / self.greatestCommonDivisor(with: other)
    }
}
