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
        label.textColor = .green
        label.numberOfLines = 4
        return label
    }()
    
    private var issueLabel: UILabel = {
        let label = UILabel()
        label.text = "Issue #"
        label.textColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private var digitalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Digital Price: $"
        label.textColor = .green
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price: $"
        label.textColor = .green
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Buy", for: .normal)
        return button
    }()
    
    private var addToCartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
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
        backgroundColor = .black
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
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(5)
            $0.trailing.equalTo(5)
        }
    }
    
    private func setupCover() {
        addSubview(coverImage)
        
        coverImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
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
            $0.trailing.equalTo(5)
        }
    }
    
    private func setupPrice() {
        addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(issueLabel.snp.bottom).offset(10)
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
            $0.trailing.equalTo(5)
        }
    }
    
    private func setupDigitalPrice() {
        addSubview(digitalPriceLabel)
        
        digitalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
            $0.trailing.equalTo(5)
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
    
    
    func setValues(comic: ComicModel, buyAction: Selector, cartAction: Selector, controller: UIViewController) {
        titleLabel.text = comic.title?.titleFormat()
        issueLabel.text = "Issue #\(comic.issueNumber ?? 0)"
        
        guard let prices = comic.prices else { return }
        
        for price in prices {
            if let printPrice = price.printPrice() {
                priceLabel.text = "Price: $\(printPrice)"
            } else {
                priceLabel.text = "Print Price: Not Available"
            }
            
            if let digitalPrice = price.digitalPrice() {
                digitalPriceLabel.text = "Price: $\(digitalPrice)"
            } else {
                digitalPriceLabel.text = "Digital Price: Not Available"
            }
            
        }
        
        let url = URL(string: (comic.thumbnail?.path ?? "")+".jpg")
        coverImage.kf.setImage(with: url)
        
        buyButton.addTarget(controller, action: buyAction, for: .touchDown)
        addToCartButton.addTarget(controller, action: cartAction, for: .touchDown)
        
    }

    
}

