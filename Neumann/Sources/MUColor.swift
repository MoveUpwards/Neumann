//
//  MUColor.swift
//  Sejima
//
//  Created by Loïc GRIFFIE on 18/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

#if canImport(CoreGraphics)

import CoreGraphics

extension CGColor {
    /// Return the red component of the CGColor
    internal var r: CGFloat {
        return components?[0] ?? 0.0
    }

    /// Return the green component of the CGColor
    internal var g: CGFloat {
        return components?[numberOfComponents == 2 ? 0 : 1] ?? 0.0
    }

    /// Return the blue component of the CGColor
    internal var b: CGFloat {
        return components?[numberOfComponents == 2 ? 0 : 2] ?? 0.0
    }

    /// Return the alpha component of the CGColor
    internal var a: CGFloat {
        return components?[numberOfComponents == 2 ? 1 : 3] ?? 0.0
    }

    /// Return the hexInt of the CGColor
    public var hex: Int { return Int(r * 255.0) << 16 + Int(g * 255.0) << 8 + Int(b * 255.0) }

    /// Retrun the ARGB int of the CGColor
    public var argb: Int { return Int(a) << 24 + hex }
}

#endif

#if canImport(UIKit)

import UIKit.UIColor

extension UIColor {
    /**
     Interpolate a fraction between the current color and a second one

     - Parameters:
     - to: The second color.
     - fraction: The percent of current color and second one.
     */
    public func interpolate(to: UIColor, fraction: CGFloat) -> UIColor? {
        let f = min(max(0, fraction), 1) // Ensure that fraction is between 0 and 1
        return UIColor(red: cgColor.r + (to.cgColor.r - cgColor.r) * f,
                       green: cgColor.g + (to.cgColor.g - cgColor.g) * f,
                       blue: cgColor.b + (to.cgColor.b - cgColor.b) * f,
                       alpha: cgColor.a + (to.cgColor.a - cgColor.a) * f)
    }

    /**
     Create a UIColor from hexadecimal value

     - Parameters:
     - hex: The hexadecimal value.

     ```
     let darkGrey = UIColor(hex: 0x757575)
     ```
     */
    convenience public init(hex: Int, alpha: Int = 0xff) {
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255.0,
                  green: CGFloat((hex >> 8) & 0xff) / 255.0,
                  blue: CGFloat(hex & 0xff) / 255.0,
                  alpha: CGFloat(alpha & 0xff) / 255.0)
    }
}

#endif
