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
        loginViewController.viewModel = LoginViewModel(router: LoginRouter())
        loginViewController.viewModel?.router?.viewController = loginViewController
        return loginViewController
    }
}

class LoginRouter {
    var viewController: LoginViewController?
}

protocol LoginRouterProtocol {
    func routeToHome()
}

extension LoginRouter: LoginRouterProtocol {
    
    func routeToHome() {
        let navController = UINavigationController(rootViewController: HomeModule().createModule())
        navController.modalPresentationStyle = .fullScreen
        viewController?.present(navController, animated: true)
    }
}
