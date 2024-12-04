//
//  Optional+extension.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

extension Optional where Wrapped == String {
    var readable: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return "nil"
        }
    }
}
