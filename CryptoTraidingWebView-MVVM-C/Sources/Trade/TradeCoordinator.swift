//
//  TradeCoordinator.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 23.10.2023.
//

import UIKit

class TradeCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = TradeViewController()
        vc.delegateRouting = self
        vc.viewModel = TradeViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: - TopRoutingDelegate

extension TradeCoordinator: TradeRoutingDelegate {

}
