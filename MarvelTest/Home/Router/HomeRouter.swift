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
    func routeToDetail(comic: ComicModel)
}

extension HomeRouter: HomeRouterProtocol {
    
    func routeToDetail(comic: ComicModel) {
        let comicDetail = ComicDetailModule().createModule(comic: comic)
        viewController?.navigationController?.pushViewController(comicDetail, animated: true)
    }
}
