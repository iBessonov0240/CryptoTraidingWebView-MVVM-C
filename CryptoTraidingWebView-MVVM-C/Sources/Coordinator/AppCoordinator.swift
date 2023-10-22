//
//  AppCoordinator.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 22.10.2023.
//

import UIKit

class AppCoordinator: Coordinator {

    let window: UIWindow
    let rootViewController: UINavigationController

    init(window: UIWindow) {
        self.window = window

        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true

        rootViewController.setViewControllers([], animated: true)

    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
//        let startCoordinator = StartCoordinator(navigationController: rootViewController)
//        startCoordinator.start()
    }
}
