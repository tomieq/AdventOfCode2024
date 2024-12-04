//
//  Day3.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation
import Testing
@testable import AdventOfCode

class Day3 {
    let input = FileLoader.prodData(day: 3)

    func execMul(input: String) -> Int {
        var result = 0
        do {
            let pattern = #"mul\(\d+,\d+\)"#
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let matches = regex.matches(in: input, options: [], range: NSRange(input.startIndex..., in: input))
            
            result =  matches.map {
                String(input[Range($0.range, in: input)!])
                    .removed(text: "mul(")
                    .removed(text: ")")
                    .split(",")
                    .compactMap{ $0.decimal }
                    .reduce(1, *)
            }.reduce(0, +)
        } catch {
            print("Error: \(error)")
        }
        print("Result = \(result)")
        return result
    }

    @Test
    func cpuInstructions() async throws {
        let result = execMul(input: input)
        #expect(result == 178794710)
        print("Result = \(result)")
    }
    
    @Test
    func cpuInstructionsWithEnabling() async throws {
        var text = input
        var result = 0
        while let disableIndex = text.indexOf("don't()") {
            result += execMul(input: text.subString(0, disableIndex))
            text = text.subString(disableIndex + 7, text.count)
            if let enableIndex = text.indexOf("do()") {
                text = text.subString(enableIndex, text.count)
            }
        }
        result += execMul(input: text)
        #expect(result == 76729637)
        print("Result = \(result)")
    }
}
