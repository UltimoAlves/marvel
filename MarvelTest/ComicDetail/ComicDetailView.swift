//
//  ComicDetailView.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//

import UIKit
import SnapKit
import Kingfisher
class ComicDetailView: UIView {
    private var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.sizeToFit()
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Captain América"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private var issueLabel: UILabel = {
        let label = UILabel()
        label.text = "Issue #"
        return label
    }()
    
    private var digitalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Digital Price: $"
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price: $"
        return label
    }()
    
    private var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Buy", for: .normal)
        return button
    }()
    
    private var addToCartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Add to cart", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .blue
        setupTitle()
        setupCover()
        setupIssue()
        setupPrice()
        setupDigitalPrice()
        setupBuyButton()
        setupAddToCartButton()
        
    }
    
    private func setupTitle() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setupCover() {
        addSubview(coverImage)
        
        coverImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(180)
            $0.height.equalTo(300)
        }
    }
    
    private func setupIssue() {
        addSubview(issueLabel)
        
        issueLabel.snp.makeConstraints {
            $0.top.equalTo(coverImage.snp.top)
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
        }
    }
    
    private func setupPrice() {
        addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(issueLabel.snp.top).offset(50)
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
        }
    }
    
    private func setupDigitalPrice() {
        addSubview(digitalPriceLabel)
        
        digitalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.top).offset(30)
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
        }
    }
    
    private func setupBuyButton() {
        addSubview(buyButton)
        
        buyButton.snp.makeConstraints {
            $0.top.equalTo(coverImage.snp.bottom).offset(10)
            $0.trailing.equalTo(-5)
            $0.width.equalTo(coverImage.snp.width)
            $0.height.equalTo(50)
        }
    }
    
    private func setupAddToCartButton() {
        addSubview(addToCartButton)
        
        addToCartButton.snp.makeConstraints {
            $0.top.equalTo(coverImage.snp.bottom).offset(10)
            $0.left.equalTo(5)
            $0.width.equalTo(coverImage.snp.width)
            $0.height.equalTo(50)
        }
    }
    

    
}

