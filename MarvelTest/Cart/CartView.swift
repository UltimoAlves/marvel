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
        tableView.backgroundColor = .black
        tableView.rowHeight = 60
        return tableView
    }()
    
    private var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Cart is empty"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = .green
        return label
    } ()
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .black
        setupTableView()
        setupEmptyLabel()
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
    
    private func setupEmptyLabel() {
        addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func addTableviewDelegateDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setState(state: CartViewState) {
        switch state {
        case .empty:
            tableView.isHidden = true
            emptyLabel.isHidden = false
        case .filled:
            tableView.isHidden = false
            emptyLabel.isHidden = true
        }
    }
}

enum CartViewState {
    case empty
    case filled
}


