//
//  String+operator.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

//infix operator -
//func - (lhs: String, rhs: String) -> String {
//    lhs.array.filter { !rhs.array.contains($0) }.joined()
//}

func - (lhs: String?, rhs: String?) -> String {
    guard let rhs = rhs else {
        return lhs ?? ""
    }
    guard let lhs = lhs else {
        return ""
    }
    return lhs.array.filter { !rhs.array.contains($0) }.joined()
}

func + (lhs: String?, rhs: String?) -> String {
    guard let lhs = lhs else {
        return rhs ?? ""
    }
    guard let rhs = rhs else {
        return lhs
    }
    return lhs + rhs
}
