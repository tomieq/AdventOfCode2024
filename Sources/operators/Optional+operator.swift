//
//  Optional+operator.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

func += <T: AdditiveArithmetic>(lhs: inout T, rhs: T?) {
    guard let rhs = rhs else { return }
    lhs = lhs + rhs
}

func -= <T: AdditiveArithmetic>(lhs: inout T, rhs: T?) {
    guard let rhs = rhs else { return }
    lhs = lhs - rhs
}

func > <T: Comparable>(lhs: T, rhs: T?) -> Bool {
    guard let rhs = rhs else { return false }
    return lhs > rhs
}

func > <T: Comparable>(lhs: T?, rhs: T) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs > rhs
}

func < <T: Comparable>(lhs: T, rhs: T?) -> Bool {
    guard let rhs = rhs else { return false }
    return lhs < rhs
}

func < <T: Comparable>(lhs: T?, rhs: T) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs < rhs
}
