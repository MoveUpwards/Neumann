//
//  MUTimeInterval.swift
//  
//
//  Created by Damien Noël Dubuisson on 10/03/2021.
//

#if canImport(Foundation)

import Foundation

extension TimeInterval {
    /// Show the duration as a Clock Timer representation
    public func toClockTimer(with format: String = "HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: Date(timeIntervalSinceReferenceDate: self))
    }

    /// Show the duration with 2 values representations, i.e. 1h22m or 23m45s or only 40s
    public var duration: String {
        var value = Int(self)
        let seconds = value % 60
        guard self > 60 else {
            return "\(seconds)s"
        }
        value -= seconds
        let minutes = (value / 60) % 60
        guard self > 3600 else {
            return "\(minutes)m\(seconds.twoDigit)s"
        }
        value -= minutes*60
        let hours = value / 3600
        return "\(hours)h\(minutes.twoDigit)m"
    }
}

#endif
