//
//  Array+operator.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

func - <T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
    lhs.filter { !rhs.contains($0) }
}

func += <T>(lhs: inout [T], rhs: T?) {
    guard let rhs = rhs else { return }
    lhs.append(rhs)
}
