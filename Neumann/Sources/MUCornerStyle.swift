//
//  MUCornerRadiusStyle.swift
//  Sejima
//
//  Created by Loïc GRIFFIE on 06/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

#if canImport(CoreGraphics)

import CoreGraphics

/// Progress bar style representation
public enum MUCornerStyle: Equatable {
    /// Square
    case square
    /// Round
    case round
    /// Custom corner radius
    case custom(_ radius: CGFloat)
}

#endif
