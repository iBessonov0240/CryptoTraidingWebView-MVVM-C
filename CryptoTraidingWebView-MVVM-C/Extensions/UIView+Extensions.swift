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
