//
//  UIView+Extensions.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 22.10.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension UIView {
    // Функция для добавления constraints для задания позиции и размеров
    func addConstraints(
        top: NSLayoutYAxisAnchor? = nil,
        paddingTop: CGFloat = 0,

        leading: NSLayoutXAxisAnchor? = nil,
        paddingLeft: CGFloat = 0,

        trailing: NSLayoutXAxisAnchor? = nil,
        paddingRight: CGFloat = 0,

        bottom: NSLayoutYAxisAnchor? = nil,
        paddingBottom: CGFloat = 0,

        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,

        width: CGFloat = 0,
        height: CGFloat = 0
        ) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if width > 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height > 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
