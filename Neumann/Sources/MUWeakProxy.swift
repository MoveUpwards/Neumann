//
//  MUWeakProxy.swift
//  Sejima
//
//  Created by Loïc GRIFFIE on 01/11/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

#if canImport(Foundation) && !os(Linux)

import Foundation

public protocol Weakable: AnyObject {
    func updateIfNeeded()
}

/// A class that create a weak target to avoid retain cycles.
final public class MUWeakProxy {
    private weak var target: Weakable?

    /// Initialize a new object with the target to retain weakly.
    public init(_ target: Weakable) {
        self.target = target
    }

    @objc
    public func onScreenUpdate() {
        target?.updateIfNeeded()
    }
}

#endif
