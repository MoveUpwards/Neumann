//
//  FloatingPoint.swift
//  Neumann
//
//  Created by Mac on 18/06/2021.
//  Copyright © 2021 Loïc GRIFFIE. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

extension FloatingPoint {
    /// Convert current degrees to radians
    public var toRadians: Self { .pi * self / Self(180) }

    /// Convert current radians to degrees
    public var toDegrees: Self { self * Self(180) / .pi }

    /// A very close to 0 number
    public static var epsilon: Self { Self(8.85418782e-12) }

    /// The conventional gravitational acceleration on Earth's surface
    public static var g: Self { Self(9.80665) }

    /// Cast a Double to FloatingPoint
    public init(_ value: Double) {
        guard !value.isNaN else {
            self = .nan
            return
        }
        guard !value.isInfinite else {
            self = .infinity
            return
        }
        let tmp = value * 1e16
        guard tmp < Double(Int64.max) else {
            self = .infinity
            return
        }
        guard tmp > Double(Int64.min) else {
            self = -.infinity
            return
        }
        self = Self(Int64(value * 1e16)) / Self(Int64(1e16))
    }
}

/// Hav is Haversine(θ) function (https://en.wikipedia.org/wiki/Haversine_formula)
public func hav<T: FloatingPoint>(_ theta: T) -> T { T(pow(sin(Double(theta) / 2.0), 2.0)) }

extension Double {
    /// Init with a FloatingPoint or .zero if impossible
    public init<Source>(_ value: Source) where Source : FloatingPoint {
        switch value {
        case is Double:
            self = Double(value as? Double ?? .zero)
        case is Float:
            self = Double(value as? Float ?? .zero)
#if !os(Windows) && (arch(i386) || arch(x86_64))
        case is Float80:
            self = Double(value as? Float80 ?? .zero)
#endif
#if canImport(CoreGraphics)
        case is CGFloat:
            self = Double(value as? CGFloat ?? .zero)
#endif
        default:
            self = .zero
        }
    }
}
