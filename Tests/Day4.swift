//
//  Day4.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Testing
@testable import AdventOfCode

class Day4 {
//    let input = FileLoader.testData(day: 4)
    let input = FileLoader.prodData(day: 4)
    
    @Test
    func findXmas() async throws {
        var result = 0
        let map = PointMap(input: input)
        func checkWord(from point: Point, searching remainingLetters: String, direction: MoveDirection){
            guard let letter = remainingLetters[safeIndex: 0]?.string else {
                result.increment()
                return
            }
            guard map[point] == letter else { return }
            let restLetters = String(remainingLetters.dropFirst())
            checkWord(from: point.move(direction), searching: restLetters, direction: direction)
        }
        map.content.filter{ $0.value == "X" }.forEach {
            for direction in MoveDirection.allCases {
                checkWord(from: $0.key.move(direction), searching: "MAS", direction: direction)
            }
        }
        print("Result = \(result)")
    }
    
    @Test
    func findCrossedMAS() async throws {
        let map = PointMap(input: input)
        let pattern = [
            ["S", "S", "M", "M"],
            ["S", "M", "S", "M"],
            ["M", "M", "S", "S"],
            ["M", "S", "M", "S"]
        ]
        let result = map.content
            .filter { $0.value == "A" }
            .map { $0.key }
            .map { point in
                MoveDirection.allDiagonal.map { point.move($0) }.compactMap { map[$0] }
            }
            .count {
                pattern.contains($0)
            }
        print("Result = \(result)")
        #expect(result == 2034)
    }
}
