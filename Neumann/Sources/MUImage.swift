//
//  MUImage.swift
//  Sejima
//
//  Created by Loïc GRIFFIE on 07/03/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     Create a UIImage with a border and a corner radius

     - Parameters:
     - color:        The background color.
     - borderColor:  The border color.
     - borderWidth:  The border width.
     - cornerRadius: The border width.
     - size:         The size of the output image.

     ```
     let image = UIImage(color: .red, borderColor: .blue, borderWidth: 1.0, size: bounds.size)
     ```
     */
    convenience public init?(icon: UIImage? = nil,
                             padding: CGFloat = 0.0,
                             color: UIColor? = nil,
                             borderColor: UIColor? = nil,
                             borderWidth: CGFloat = 0.0,
                             cornerRadius: CGFloat = 0.0,
                             size: CGSize = CGSize(width: 1.0, height: 1.0)) {
        // If nil color, cast to clear color
        let color = color ?? .clear
        let borderColor = borderColor ?? .clear

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        let view = UIView(frame: CGRect(origin: .zero, size: size))
        view.backgroundColor = color
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = cornerRadius

        if let icon = icon {
            let image = UIImageView(image: icon)
            image.frame = CGRect(origin: CGPoint(x: padding, y: padding), size: size - padding*2.0)
            view.addSubview(image)
        }

        view.layer.render(in: context)

        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }

        self.init(cgImage: cgImage)
    }

    /// Initializes and returns the image object with the specified MUHistogram datas.
    public convenience init?(histogram: [CGFloat], bar: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext(), let maxValue = histogram.max() else {
            return nil
        }

        let barWidth = size.width / CGFloat(histogram.count + histogram.count - 1)
        var currentX = CGFloat(0.0)
        context.setAllowsAntialiasing(false)
        context.setFillColor(bar.cgColor)

        histogram.forEach { value in
            let height = value / maxValue * size.height
            let rect = CGRect(x: currentX, y: size.height - height, width: barWidth, height: height)
            context.fill(rect)

            currentX += barWidth * 2.0
        }

        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }

        self.init(cgImage: cgImage)
    }

    public convenience init?(text: String,
                             font: UIFont = .systemFont(ofSize: 12.0),
                             color: UIColor = .white) {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color

        let size = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude))
        label.frame = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        let view = UIView(frame: CGRect(origin: .zero, size: size))
        view.backgroundColor = .clear
        view.addSubview(label)

        view.layer.render(in: context)

        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }

        self.init(cgImage: cgImage)
    }
}
