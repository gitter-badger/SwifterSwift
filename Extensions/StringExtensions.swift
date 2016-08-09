//
//  StringExtensions.swift
//  SwiftierSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

import Foundation
public extension String {
    
    
    public var locale: NSLocale {
        return NSLocale.currentLocale()
    }
    
    
    public func count(of string: String) -> Int {
		return componentsSeparatedByString(string).count - 1
    }
    
    
    public func starts(with prefix: String) -> Bool {
        return hasPrefix(prefix)
    }
    
    
    public func ends(with suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
    
    
    public var empty: Bool {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet()).characters.count == 0
    }
    
    
    public func split(by separator: Character) -> [String] {
        return characters.split{$0 == separator}.map(String.init)
    }
    
    
    public var trimmed: String {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    
    public mutating func trim() {
        self = self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    
    public var firstCharacter: String? {
        return Array(self.characters).map({String($0)}).first
    }
    
    
    public var lastCharacter: String? {
        return Array(self.characters).map({String($0)}).last
    }
    
    
    public var withoutSpacesAndNewLines: String {
        return self.replace(" ", with: "").replace("\n", with: "")
    }
    
    
    public var mostCommonCharacter: String {
        var mostCommon = ""
        let charSet = Set(self.withoutSpacesAndNewLines.characters.map{String($0)})
        var count = 0
        for string in charSet {
            if self.count(of: string) > count {
                count = self.count(of: string)
                mostCommon = string
            }
        }
        return mostCommon
    }
    
    
    public var camelCaseString: String {
        let source = self.lowercaseString
		// FIXME: idk how to fix this (probably name issue)
		/*
        if source.characters.contains(" ") {
            let first = source.substring(to: source.index(after: source.startIndex))
            let camel = source.capitalized.replace(string: " ", with: "").replace(string: "\n", with: "")
            let rest = String(camel.characters.dropFirst())
            return "\(first)\(rest)"
        } else {
            let first = source.lowercased().substring(to: source.index(after: source.startIndex))
            let rest = String(source.characters.dropFirst())
            return "\(first)\(rest)"
            
        }
		*/
		return "" // FIXME: let the test fail
    }
    
    
    public mutating func camelize() {
        self = self.camelCaseString
    }
    
    
    public func lines() -> [String] {
        var result:[String] = []
        enumerateLines { (line, stop) -> () in
            result.append(line)
        }
        return result
    }
    
    
    public var isEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
		// FIXME: email checking may be faulty!
    }
    
    
    public var isHttpUrl: Bool {
        guard self.starts(with: "http://".lowercaseString) else {
            return false
        }
        return NSURL(string: self) != nil
    }
    
    
    public var isHttpsUrl: Bool {
        guard self.starts(with: "https://".lowercaseString) else {
            return false
        }
        return NSURL(string: self) != nil
    }
    
    
    public var reversed: String {
        return String(characters.reverse())
    }
    
    
    public mutating func reverse() {
        self = String(characters.reverse())
    }
    
    
    public func firstIndex(of string: String) -> Int? {
		// FIXME: no [String] doesnt have member index
        //return Array(self.characters).map({String($0)}).index(of: string)
		return -1 // let it fail
    }
    
    public func replace(string: String, with: String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: with)
    }
    
    public var hasNumbers: Bool {
		return rangeOfCharacterFromSet(.decimalDigitCharacterSet(), options: .LiteralSearch, range: nil) != nil
    }
    
    
    public var hasLetters: Bool {
        return rangeOfCharacterFromSet(.letterCharacterSet(), options: .NumericSearch, range: nil) != nil
    }
    
    
    public var isNumeric: Bool {
        return  !hasLetters && hasNumbers
    }
    
    
    public var isAlphabetic: Bool {
        return  hasLetters && !hasNumbers
    }
    
    
    public var isAlphaNumeric: Bool {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.alphanumericCharacterSet()).joinWithSeparator("").characters.count == 0 && hasLetters && hasNumbers
    }
    
    
    public var latinized: String {
        return self.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
    }
    
    
    public mutating func latinize() {
        self = self.latinized
    }
    
    
    public static func random(of length: Int) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var string = ""
        for _ in 0..<length {
            let randomIndex = arc4random_uniform(UInt32(base.characters.count))
			// FIXME: couldnt fix :)
            //string += "\(base[base.index(base.startIndex, offsetBy: IndexDistance(randomIndex))])"
        }
        return string
    }
    
    
    public var toInt: Int? {
        return Int(self)
    }
    
    
    public var toInt8: Int8? {
        return Int8(self)
    }
    
    
    public var toInt16: Int16? {
        return Int16(self)
    }
    
    
    public var toInt32: Int32? {
        return Int32(self)
    }
    
    
    public var toInt64: Int64? {
        return Int64(self)
    }
    
    
    public var toFloat: Float? {
        return Float(self)
    }
    
    
    public var toFloat32: Float32? {
        return Float32(self)
    }
    
    
    public var toFloat64: Float64? {
        return Float64(self)
    }
    
    
    public var toFloat80: Float80? {
        return Float80(self)
    }
    
    
    public var toDouble: Double? {
        return Double(self)
    }
    
    
    public var toBool: Bool? {
        if self == "true" || self == "TRUE" || self == "1" {
            return true
        } else if self == "false" || self == "FLASE" || self == "0" {
            return false
        } else {
            return nil
        }
    }
}
