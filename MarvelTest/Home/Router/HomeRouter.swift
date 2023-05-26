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
        homeViewController.viewModel = HomeViewModel(router: HomeRouter(),
                                                     service: HomeService(),
                                                     delegate: homeViewController)
        
        homeViewController.viewModel?.router?.viewController = homeViewController
        return homeViewController
    }
}

class HomeRouter {
   weak var viewController: UIViewController?

}

protocol HomeRouterProtocol: AnyObject {
    func routeToDetail()
}

extension HomeRouter: HomeRouterProtocol {
    
    func routeToDetail() {
        let home = ComicDetailViewController()
        viewController?.navigationController?.pushViewController(home, animated: true)
    }
}
