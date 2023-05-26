//
//  ComicDetailRouter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//
import Foundation
import UIKit

class ComicDetailModule {
    func createModule(comic: ComicModel) -> ComicDetailViewController {
        let comicDetailViewController = ComicDetailViewController()
        comicDetailViewController.viewModel = ComicDetailViewModel(router: ComicDetailRouter(),
                                                                   comic: comic,
                                                                   delegate: comicDetailViewController)
        
        comicDetailViewController.viewModel?.router?.viewController = comicDetailViewController
        return comicDetailViewController
    }
}

class ComicDetailRouter {
   weak var viewController: UIViewController?

}

protocol ComicDetailRouterProtocol: AnyObject {
    func routeToDetail()
}

extension ComicDetailRouter: ComicDetailRouterProtocol {
    
    func routeToDetail() {
//        let home = ComicDetailViewController()
//        viewController?.navigationController?.pushViewController(home, animated: true)
    }
}
