//
//  HomeRouter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import UIKit

class HomeModule {
    func createModule(homeViewModel: HomeViewModel) -> HomeViewController {
        let homeViewController = HomeViewController()
        homeViewController.viewModel = homeViewModel
        homeViewController.viewModel?.router = HomeRouter()
        homeViewController.viewModel?.router?.viewController = homeViewController
        return homeViewController
    }
}

class HomeRouter {
    var viewController: UIViewController?
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
