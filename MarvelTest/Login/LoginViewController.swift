//
//  LoginViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 05/05/23.
//

import UIKit

class LoginViewController: UIViewController {

    private let mainView = LoginView()
    private let viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        viewModel.delegate = self
        view = mainView
        
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginTapped(email: String, password: String) {
        viewModel.authenticate(email: email, password: password)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func loginFailure() {
        let alert = UIAlertController(title: "Error", message: "User not found", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func loginSuccess() {
        print("sucesso")
    }
}
