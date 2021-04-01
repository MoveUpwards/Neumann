//
//  MUSize.swift
//  Neumann
//
//  Created by Mac on 26/10/2020.
//  Copyright © 2020 Loïc GRIFFIE. All rights reserved.
//

#if canImport(CoreGraphics)

import CoreGraphics

extension CGSize {
    public static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
}

#endif
