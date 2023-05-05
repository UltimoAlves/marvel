//
//  LoginViewModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 05/05/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func loginFailure()
    func loginSuccess()
}

public final class LoginViewModel {
    
    weak var delegate : LoginViewModelDelegate?
    private let coreData = CoreDataManager()
    private var userModel: User?
    init(delegate: LoginViewModelDelegate? = nil) {
        self.delegate = delegate
        verifyUser()
        
    }
    
    func verifyUser() {
        if !coreData.verifyIfExistsUser() {
            coreData.createUser()
        }
    }
    
    
    func authenticate(email: String, password: String) {
        if coreData.aunthenticate(email: email, password: password) {
            delegate?.loginSuccess()
        } else {
            delegate?.loginFailure()
        }
    }
}
