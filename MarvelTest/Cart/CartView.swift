//
//  CartView.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//


import UIKit
import SnapKit

class CartView: UIView {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartCell.self, forCellReuseIdentifier: CartCell.id)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    func addTableviewDelegateDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

