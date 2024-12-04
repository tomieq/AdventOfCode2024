//
//  Logger.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//

import Foundation

enum Logger {
    public static func v(_ label: String?, _ log: String) {
        Self.print(label, log)
    }

    public static func e(_ label: String?, _ log: String) {
        Self.print(label.readable + "❗", log)
    }

    private static func print(_ label: String?, _ log: String) {
        let log = log.replacingOccurrences(of: "\\/", with: "/")
        let localMessage = "\(Self.logDate()) [\(label.readable)] \(log)"
        Swift.print(localMessage)
    }

    private static func logDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: Date())
    }
}
