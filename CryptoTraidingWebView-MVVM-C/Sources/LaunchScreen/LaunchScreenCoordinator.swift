//
//  LaunchScreenCoordinator.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 22.10.2023.
//

import UIKit

class LaunchScreenCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }

    func start() {
        let vc = LaunchScreenViewController()

        vc.delegateRouting = self
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - StartRoutingDelegate
extension LaunchScreenCoordinator: LaunchScreenRoutingDelegate {
    func routeToTabBar() {
        TabBarCoordinator(navigationController: navigationController).start()
    }
}
