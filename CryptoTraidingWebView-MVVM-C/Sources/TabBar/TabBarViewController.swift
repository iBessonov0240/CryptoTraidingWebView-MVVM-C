//
//  TabBarViewController.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 23.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = Theme.greenColor
        self.tabBar.backgroundColor = Theme.backgroundColor
        self.tabBar.unselectedItemTintColor = Theme.darkGrayColor
    }
}
