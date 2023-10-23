//
//  TopCoordinator.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 23.10.2023.
//

import UIKit

class TopCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = TopViewController()
        vc.delegateRouting = self
        vc.viewModel = TopViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - TopRoutingDelegate

extension TopCoordinator: TopRoutingDelegate {
    
}
