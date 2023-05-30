//
//  CartRouter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import Foundation
import UIKit

class CartModule {
    func createModule() -> CartViewController {
        let homeViewController = CartViewController()
        homeViewController.viewModel = CartViewModel(router: CartRouter(),
                                                     delegate: homeViewController)
        
        homeViewController.viewModel?.router?.viewController = homeViewController
        return homeViewController
    }
}

class CartRouter {
   weak var viewController: UIViewController?

}

