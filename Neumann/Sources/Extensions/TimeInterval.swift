//
//  MUTimeInterval.swift
//  
//
//  Created by Damien Noël Dubuisson on 10/03/2021.
//

#if canImport(Foundation)

import Foundation

extension TimeInterval {

    /// Return the number of hours
    public var hours: Int { ((Int(self) - seconds - minutes*60) / 3600) }

    /// Return the number of minutes
    public var minutes: Int { ((Int(self) - seconds) / 60) % 60 }

    /// Return the number of seconds
    public var seconds: Int { Int(self) % 60 }

    /// Show the duration as a Clock Timer representation
    public func toClockTimer(with format: String = "HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: Date(timeIntervalSinceReferenceDate: self))
    }

    /// Show the duration with 2 values representations, i.e. 1h22m or 23m45s or only 40s
    public var duration: String {
        guard self > 60 else { return "\(seconds)s" }

        guard self > 3600 else { return "\(minutes)m\(seconds.twoDigit)s" }

        return "\(hours)h\(minutes.twoDigit)m"
    }
}

#endif
