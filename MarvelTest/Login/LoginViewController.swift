//
//  LoginViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 05/05/23.
//

import UIKit

class LoginViewController: UIViewController {

    private let mainView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }
}
