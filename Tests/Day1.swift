//
//  Day1.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Testing
@testable import AdventOfCode

class Day1 {
    let input = FileLoader.prodData(day: 1)
    
    @Test
    func twoLists() {
        var leftList: [Int] = []
        var rightList: [Int] = []
        input.split("\n")
            .filter { !$0.isEmpty }
            .forEach {
                let parts = $0.split("   ").tuple
                leftList.append(parts.0.decimal)
                rightList.append(parts.1.decimal)
            }
        leftList.sort()
        rightList.sort()
        let result = leftList.enumerated()
            .map{ abs($0.element - rightList[$0.offset]) }
            .reduce(0, +)
        print("Result = \(result)")
        #expect(result == 2066446)
    }
    
    @Test
    func twoListsFixed() {
        var leftList: [Int] = []
        var rightList: [Int] = []
        input.split("\n")
            .filter { !$0.isEmpty }
            .forEach {
                let parts = $0.split("   ").tuple
                leftList.append(parts.0.decimal)
                rightList.append(parts.1.decimal)
            }
        
        let result = leftList.map { number in
            rightList.count{ $0 == number} * number
        }.reduce(0, +)
        print("Result = \(result)")
        #expect(result == 24931009)
    }
}
