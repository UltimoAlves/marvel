//
//  HomeRouter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import UIKit

class HomeModule {
    func createModule() -> HomeViewController {
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel(router: HomeRouter(viewController: homeViewController),
                                                     service: HomeService(),
                                                     delegate: homeViewController)
        return homeViewController
    }
}

class HomeRouter {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

protocol HomeRouterProtocol {
    func routeToDetail(homeViewModel: HomeViewModel?)
}

extension HomeRouter: HomeRouterProtocol {
    
    func routeToDetail(homeViewModel: HomeViewModel?) {
        let home = LoginModule().createModule()
        viewController?.present(home, animated: true)
    }
}
