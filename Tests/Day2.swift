//
//  Day2.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Testing
@testable import AdventOfCode

class Day2 {
    let input = FileLoader.prodData(day: 2)

    var reports: [[Int]] {
        input.split("\n")
            .filter { !$0.isEmpty }
            .map {
                $0.split(" ").compactMap{ $0.decimal }
            }
    }

    @Test
    func reactorReports() {
        let result = reports
            .map { list in
                list.enumerated()
                .compactMap { (offset, element) -> Int? in
                    guard let nextNumber = list[safeIndex: offset.incremented] else {
                        return nil
                    }
                    return element - nextNumber
                }
            }.filter { list in
                list.allSatisfy { (1...3).contains(abs($0)) }
            }.filter { list in
                list.allSatisfy { $0 > 0} || list.allSatisfy { $0 < 0}
            }.count
        print("Result = \(result)")
        #expect(result == 524)
    }
    
    @Test
    func reactorReportsFixed() {
        func isReportSafe(_ numbers: [Int]) -> Bool {
            let diff = numbers.enumerated()
            .compactMap { (offset, element) -> Int? in
                guard let nextNumber = numbers[safeIndex: offset.incremented] else {
                    return nil
                }
                return element - nextNumber
            }
            return diff.allSatisfy { (1...3).contains(abs($0)) } && (diff.allSatisfy { $0 > 0} || diff.allSatisfy { $0 < 0})
        }
        let result = reports
            .filter { list in
                if isReportSafe(list) {
                    return true
                }
                for index in (0..<list.count) {
                    if isReportSafe(list.removed(index: index)) {
                        return true
                    }
                }
                return false
            }.count
        print("Result = \(result)")
        #expect(result == 569)
    }
}
