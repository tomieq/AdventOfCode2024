//
//  Point.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

struct Point: CustomStringConvertible, Hashable {
    let x: Int
    let y: Int

    var description: String {
        "(x: \(self.x), y: \(self.y))"
    }
}

/*
 0,0
   ______> x
  |
  |

  y
  */

extension Point {
    func move(_ direction: MoveDirection) -> Point {
        switch direction {
        case .right:
            return Point(x: self.x.incremented, y: self.y)
        case .left:
            return Point(x: self.x.decremented, y: self.y)
        case .up:
            return Point(x: self.x, y: self.y.decremented)
        case .down:
            return Point(x: self.x, y: self.y.incremented)
        case .upRight:
            return Point(x: self.x.incremented, y: self.y.decremented)
        case .upLeft:
            return Point(x: self.x.decremented, y: self.y.decremented)
        case .downRight:
            return Point(x: self.x.incremented, y: self.y.incremented)
        case .downLeft:
            return Point(x: self.x.decremented, y: self.y.incremented)
        }
    }
}
