//
//  LoginRouter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import UIKit

class LoginModule {
    func createModule() -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.viewModel = LoginViewModel()
        loginViewController.viewModel?.router = LoginRouter()
        loginViewController.viewModel?.router?.viewController = loginViewController
        return loginViewController
    }
}

class LoginRouter {
    var viewController: LoginViewController?
}

protocol LoginRouterProtocol {
    func routeToHome(homeViewModel: HomeViewModel)
}

extension LoginRouter: LoginRouterProtocol {
    
    func routeToHome(homeViewModel: HomeViewModel) {
        let navController = UINavigationController(rootViewController: HomeModule().createModule(homeViewModel: homeViewModel))
        navController.modalPresentationStyle = .fullScreen
        viewController?.present(navController, animated: true)
    }
}
