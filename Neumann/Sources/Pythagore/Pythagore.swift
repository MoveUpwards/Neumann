//
//  Pythagore.swift
//  Neumann
//
//  Created by Mac on 07/06/2021.
//  Copyright © 2021 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public struct Pythagore {}

/// Give simple access to all formula for Right Triangle
extension Pythagore {
    public typealias PythagoreFloat = FloatingPoint & ExpressibleByFloatLiteral

    // MARK: - Hypotenuse

    /// Hypotenuse form Adjacent and Opposite sides
    public static func hypotenuse<T: PythagoreFloat>(adjacent: T, opposite: T) -> T {
        (adjacent * adjacent + opposite * opposite).squareRoot()
    }

    // MARK: - Side

    /// Adjacent or Opposite sides from the other side and the Hypotenuse
    public static func side<T: PythagoreFloat>(otherSide: T, hypotenuse: T) -> T {
        (hypotenuse * hypotenuse - otherSide * otherSide).squareRoot()
    }

    /// Adjacent side from the opposite side and the alpha angle
    public static func adjacent<T: PythagoreFloat>(opposite: T, alpha: T) -> T {
        T(Double(opposite) / tan(Double(alpha)))
    }

    /// Adjacent side from the hypotenuse side and the alpha angle
    public static func adjacent<T: PythagoreFloat>(hypotenuse: T, alpha: T) -> T {
        T(Double(hypotenuse) * cos(Double(alpha)))
    }

    /// Opposite side from the adjacent side and the alpha angle
    public static func opposite<T: PythagoreFloat>(adjacent: T, alpha: T) -> T {
        T(Double(adjacent) * tan(Double(alpha)))
    }

    /// Opposite side from the hypotenuse side and the alpha angle
    public static func opposite<T: PythagoreFloat>(hypotenuse: T, alpha: T) -> T {
        T(Double(hypotenuse) * sin(Double(alpha)))
    }

    // MARK: - Altitude

    /// A line segment through a vertex and perpendicular to a line containing the base
    public static func altitude<T: PythagoreFloat>(adjacent: T, opposite: T, hypotenuse: T) -> T {
        adjacent * opposite / hypotenuse
    }

    // MARK: - Alpha

    /// Alpha angle from the adjacent and opposite sides
    public static func alpha<T: PythagoreFloat>(adjacent: T, opposite: T) -> T {
        T(atan(Double(opposite / adjacent)))
    }

    /// Alpha angle from the adjacent and hypotenuse sides
    public static func alpha<T: PythagoreFloat>(adjacent: T, hypotenuse: T) -> T {
        T(acos(Double(adjacent / hypotenuse)))
    }

    /// Alpha angle from the opposite and hypotenuse sides
    public static func alpha<T: PythagoreFloat>(opposite: T, hypotenuse: T) -> T {
        T(asin(Double(opposite / hypotenuse)))
    }

    // MARK: - Beta

    /// Beta angle from the adjacent and opposite sides
    public static func beta<T: PythagoreFloat>(adjacent: T, opposite: T) -> T {
        T(atan(Double(adjacent / opposite)))
    }

    /// Beta angle from the adjacent and hypotenuse sides
    public static func beta<T: PythagoreFloat>(adjacent: T, hypotenuse: T) -> T {
        T(asin(Double(adjacent / hypotenuse)))
    }

    /// Beta angle from the opposite and hypotenuse sides
    public static func beta<T: PythagoreFloat>(opposite: T, hypotenuse: T) -> T {
        T(acos(Double(opposite / hypotenuse)))
    }

    // MARK: - Is Right

    /// Check if the values match a right triangle
    public static func isRight<T: PythagoreFloat>(adjacent: T, opposite: T, hypotenuse: T) -> Bool {
        adjacent*adjacent + opposite*opposite == hypotenuse*hypotenuse
    }
}
