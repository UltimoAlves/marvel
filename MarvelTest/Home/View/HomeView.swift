//
//  HomeView.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3 - 10, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.id)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private var spinner: UIActivityIndicatorView = {
        let activeIndicator = UIActivityIndicatorView(style: .large)
        activeIndicator.color = .green
        return activeIndicator
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setupCollectionView()
        setupSpinner()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    private func setupSpinner() {
        addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    func showSpinner() {
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.stopAnimating()
    }
    
    func addCollectionviewDelegateDataSource(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}

