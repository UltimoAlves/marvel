//
//  LoginView.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 05/05/23.
//

import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    func loginTapped(email: String, password: String)
}

class LoginView: UIView {
    
    private let emailLbl: UILabel = {
        let label = UILabel()
        label.text = "EMAIL"
        return label
    }()
    
    private let passwordLbl: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD"
        return label
    }()
    
    private let emailTxtF: UITextField = {
        let txtF = UITextField()
        txtF.placeholder = "email"
        txtF.borderStyle = .roundedRect
        txtF.keyboardType = .emailAddress
        txtF.autocapitalizationType = .none
        return txtF
    }()
    
    private let passwordTxtF: UITextField = {
        let txtF = UITextField()
        txtF.placeholder = "password"
        txtF.borderStyle = .roundedRect
        txtF.isSecureTextEntry = true
        return txtF
    }()
    
    private lazy var loginLbl: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        return label
    }()
    
    private lazy var loginBtn: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.cyan, for: .highlighted)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let countrySegemnt = UISegmentedControl(items: ["USA", "BR"])
    private let collectionNewsView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 300, height: 150)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    let refreshControl = UIRefreshControl()
    weak var delegate : LoginViewDelegate?
    
    
    
    init() {
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .cyan
        
        setupLoginLbl()
        setupEmailLbl()
        setupEmailTxtF()
        setupPasswordLbl()
        setupPasswordTxtF()
        setupLoginBtn()
    }
    
//MARK: SETUP INDIVIDUAL COMPONENTS
    private func setupLoginLbl() {
        addSubview(loginLbl)
        
        loginLbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
    }
    
    private func setupEmailLbl() {
        addSubview(emailLbl)
        
        emailLbl.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-100)
            $0.leading.equalToSuperview().offset(30)
        }
    }
    
    private func setupEmailTxtF() {
        addSubview(emailTxtF)
        
        emailTxtF.snp.makeConstraints {
            $0.top.equalTo(emailLbl.snp.bottom).offset(10)
            $0.leading.equalTo(emailLbl.snp.leading)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupPasswordLbl() {
        addSubview(passwordLbl)
        
        passwordLbl.snp.makeConstraints {
            $0.top.equalTo(emailTxtF.snp.bottom).offset(20)
            $0.leading.equalTo(emailLbl.snp.leading)

        }
    }
    
    private func setupPasswordTxtF() {
        addSubview(passwordTxtF)
        
        passwordTxtF.snp.makeConstraints {
            $0.top.equalTo(passwordLbl.snp.bottom).offset(10)
            $0.leading.equalTo(emailLbl.snp.leading)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupLoginBtn() {
        addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTxtF.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
    }
    

    @objc private func loginAction() {
        delegate?.loginTapped(email: emailTxtF.text ?? "", password: passwordTxtF.text ?? "")
    }
    
}
