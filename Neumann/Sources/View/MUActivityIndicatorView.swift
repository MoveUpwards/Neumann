//
//  MUActivityIndicatorView.swift
//  
//
//  Created by Loïc GRIFFIE on 28/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

#if canImport(UIKit)

import Foundation
import UIKit.UIColor
import UIKit.UIActivityIndicatorView

/// Make UIActivityIndicatorView conforms to MUActivityIndicatorProtocol
extension UIActivityIndicatorView: MUActivityIndicatorProtocol { }

/// Activity indicator protocol.
@objc public protocol MUActivityIndicatorProtocol: class {
    /// Start indicator animation.
    func startAnimating()

    /// Stop indicator animation.
    func stopAnimating()

    // implicit unwrap to be objc compliant (see UIActivityIndicatorView)
    /// Progress indicator tint color.
    var color: UIColor! { get set } //swiftlint:disable:this implicitly_unwrapped_optional

    /// Hide indicator progress when not animating.
    var hidesWhenStopped: Bool { get set }

    /// Get current progress animation state.
    var isAnimating: Bool { get }
}

#endif
