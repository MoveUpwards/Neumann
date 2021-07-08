//
//  MUString.swift
//  Sejima
//
//  Created by Loïc GRIFFIE on 05/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

#if canImport(Foundation)

import Foundation

extension String {
    /// Return a substring from a given index
    public func substring(fromIndex: Int) -> String { self[min(fromIndex, count) ..< count] }

    /// Return a substring up to a given index
    public func substring(toIndex: Int) -> String { self[0 ..< max(0, toIndex)] }

    /// Return a character at a given index
    public subscript (i: Int) -> String { self[i ..< i + 1] }

    /// Return a substring from a given range
    public subscript (r: Range<Int>) -> String {
        let lower = max(0, min(count, r.lowerBound))
        let upper = min(count, max(0, r.upperBound))
        let range = Range(uncheckedBounds: (lower: lower, upper: upper))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)

        return String(self[start ..< end])
    }
}

extension String {
    /// Return a random String of expected length
    public static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        while randomString.utf8.count < length {
            let randomLetter = letters.randomElement()
            randomString += randomLetter?.description ?? ""
        }
        return randomString
    }

    /// Check if string is valid with given regex
    public func isValidRegex(_ regex: String) -> Bool {
        !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    /// Check if string is only letters character set
    public var isLetters: Bool {
        CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: self))
    }

    /// Check if string is only digits character set
    public var isDigits: Bool {
        CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }

    /// Check if string is only alpha numerics character set
    public var isAlphanumerics: Bool {
        CharacterSet.alphanumerics.isSuperset(of: CharacterSet(charactersIn: self))
    }

    /// Sejima: Returns a localized string, with an optional comment for translators.
    ///
    ///        "Hello world".localized -> Bonjour le monde
    ///
    public func localized(comment: String = "") -> String {
        NSLocalizedString(self, comment: comment)
    }

    /// Sejima: Check if string is valid email format.
    ///
    /// - Note: Note that this property does not validate the email address against an email server.
    /// It merely attempts to determine whether its format is suitable for an email address.
    ///
    ///        "john@doe.com".isValidEmail -> true
    ///        "❤️@❤️.com".isValidEmail -> true
    ///        "aa@❤️.co".isValidEmail -> true
    ///        "aa@aa.c".isValidEmail -> false
    ///        "a@a.co".isValidEmail -> false
    ///        "a@❤️.com".isValidEmail -> false
    ///        "aa@❤️.c".isValidEmail -> false
    ///
    public var isValidEmail: Bool {
        let regex = ".*@.*\\..{2,64}"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    /// Returns a 6 digits `Int`. Usefull to transform a color Hex representation to a Int representation
    public var hex: Int {
        guard self.count == 6,
              let r = UInt8(self[0..<2], radix: 16),
              let g = UInt8(self[2..<4], radix: 16),
              let b = UInt8(self[4..<6], radix: 16) else { return 0 }

        return Int(r) << 16 + Int(g) << 8 + Int(b)
    }
}

#endif

#if canImport(CoreGraphics) && canImport(UIKit)

import CoreGraphics
import UIKit.UIFont

extension String {
    /// Returns bounding box size for a given font
    public func constrainedSize(width: CGFloat = .greatestFiniteMagnitude,
                                height: CGFloat = .greatestFiniteMagnitude,
                                font: UIFont) -> CGSize {
        let rect = CGSize(width: width, height: height)
        return self.boundingRect(with: rect,
                                 options: .usesLineFragmentOrigin,
                                 attributes: [.font: font],
                                 context: nil).size
    }
}

#endif
