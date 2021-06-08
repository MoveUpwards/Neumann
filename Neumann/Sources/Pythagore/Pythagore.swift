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
    // MARK: - Hypotenuse

    /// Hypotenuse form Adjacent and Opposite sides
    public static func hypotenuse(adjacent: Double, opposite: Double) -> Double {
        sqrt(pow(adjacent, 2) + pow(opposite, 2))
    }

    // MARK: - Side

    /// Adjacent or Opposite sides from the other side and the Hypotenuse
    public static func side(otherSide: Double, hypotenuse: Double) -> Double {
        sqrt(pow(hypotenuse, 2) - pow(otherSide, 2))
    }

    /// Adjacent side from the opposite side and the alpha angle
    public static func adjacent(opposite: Double, alpha: Double) -> Double {
        opposite / tan(alpha)
    }

    /// Adjacent side from the hypotenuse side and the alpha angle
    public static func adjacent(hypotenuse: Double, alpha: Double) -> Double {
        return hypotenuse * cos(alpha)
    }

    /// Opposite side from the adjacent side and the alpha angle
    public static func opposite(adjacent: Double, alpha: Double) -> Double {
        adjacent * tan(alpha)
    }

    /// Opposite side from the hypotenuse side and the alpha angle
    public static func opposite(hypotenuse: Double, alpha: Double) -> Double {
        return hypotenuse * sin(alpha)
    }

    // MARK: - Altitude

    /// A line segment through a vertex and perpendicular to a line containing the base
    public static func altitude(adjacent: Double, opposite: Double, hypotenuse: Double) -> Double {
        (adjacent * opposite) / hypotenuse
    }

    // MARK: - Alpha

    /// Alpha angle from the adjacent and opposite sides
    public static func alpha(adjacent: Double, opposite: Double) -> Double {
        atan(opposite / adjacent)
    }

    /// Alpha angle from the adjacent and hypotenuse sides
    public static func alpha(adjacent: Double, hypotenuse: Double) -> Double {
        acos(adjacent / hypotenuse)
    }

    /// Alpha angle from the opposite and hypotenuse sides
    public static func alpha(opposite: Double, hypotenuse: Double) -> Double {
        asin(opposite / hypotenuse)
    }

    // MARK: - Beta

    /// Beta angle from the adjacent and opposite sides
    public static func beta(adjacent: Double, opposite: Double) -> Double {
        atan(adjacent / opposite)
    }

    /// Beta angle from the adjacent and hypotenuse sides
    public static func beta(adjacent: Double, hypotenuse: Double) -> Double {
        asin(adjacent / hypotenuse)
    }

    /// Beta angle from the opposite and hypotenuse sides
    public static func beta(opposite: Double, hypotenuse: Double) -> Double {
        acos(opposite / hypotenuse)
    }

    // MARK: - Is Right

    /// Check if the values match a right triangle
    public static func isRight(adjacent: Double, opposite: Double, hypotenuse: Double) -> Bool {
        adjacent*adjacent + opposite*opposite == hypotenuse*hypotenuse
    }
}
