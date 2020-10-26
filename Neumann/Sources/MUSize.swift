//
//  MUSize.swift
//  Neumann
//
//  Created by Mac on 26/10/2020.
//  Copyright © 2020 Loïc GRIFFIE. All rights reserved.
//

import UIKit

extension CGSize {
    public static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
}
