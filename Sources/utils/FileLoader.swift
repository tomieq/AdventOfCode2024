//
//  FileLoader.swift
//  AdventOfCode2024
//
//  Created by Tomasz on 04/12/2024.
//
import Foundation

let absolutePath = "/Users/tomaskuc/dev/AdventOfCode2024/Data/"

class FileLoader {
    private static let logTag = "FileLoader"
    
    static func testData(day: Int) -> String {
        Self.load(absolutePath: absolutePath + "Day\(day)/test.txt")
    }
    
    static func prodData(day: Int) -> String {
        Self.load(absolutePath: absolutePath + "Day\(day)/input.txt")
    }

    private static func load(absolutePath: String) -> String {
        let url = URL(fileURLWithPath: absolutePath)
        do {
            Logger.v(self.logTag, "Loading \(absolutePath)")
            return try String(contentsOf: url)
        } catch {
            fatalError("Error loading file from \(url.absoluteString)")
        }
    }
}
