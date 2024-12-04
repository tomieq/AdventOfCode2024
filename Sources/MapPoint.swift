//
//  MapPoint.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

class MapPoint {
    var content: [Point: String] = [:]
    
    init(input: String) {
        let lines = input.split("\n").filter{ !$0.isEmpty }
        for (y, line) in lines.enumerated() {
            for (x, value) in line.array.enumerated() {
                content[Point(x: x, y: y)] = value
            }
        }
    }
    
    subscript(point: Point) -> String? {
        content[point]
    }
}
