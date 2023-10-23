//
//  TabBarCoordinator.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 23.10.2023.
//

import UIKit

class TabBarCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        DispatchQueue.main.async {
            let tabBarController = TabBarViewController()


            let item1 = TradeViewController()
            item1.delegateRouting = self
            item1.viewModel = TradeViewModel()
            let icon1 = UITabBarItem(title: "Trade", image: UIImage(named: "ic-trade"), tag: 0)
            item1.tabBarItem = icon1
            let item2 = TopViewController()
            item2.delegateRouting = self
            item2.viewModel = TopViewModel()
            let icon2 = UITabBarItem(title: "Top", image: UIImage(named: "ic-top"), tag: 1)
            item2.tabBarItem = icon2

            let controllers = [item1, item2]
            tabBarController.viewControllers = controllers
            tabBarController.selectedIndex = 1
            self.navigationController.pushViewController(tabBarController, animated: false)
        }
    }
}

// MARK: - TopRoutingDelegate

extension TabBarCoordinator: TopRoutingDelegate {

}

// MARK: - TradeRoutingDelegate

extension TabBarCoordinator: TradeRoutingDelegate {

}
