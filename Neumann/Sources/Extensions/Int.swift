//
//  MUInt.swift
//  
//
//  Created by Damien Noël Dubuisson on 10/03/2021.
//

extension Int {
    /// Returns a two digit representation
    public var twoDigit: String {
        String(format: "%02d", self)
    }

    /// Returns a 6 digits representation. Usefull to transform a color `Int` representation to a Hex representation
    public var hex: String {
        String(format: "%02X%02X%02X", (self >> 16) & 0xFF, (self >> 8) & 0xFF, self & 0xFF)
    }
}
