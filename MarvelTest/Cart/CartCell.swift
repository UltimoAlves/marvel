//
//  CartCell.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import Foundation
import UIKit
import Kingfisher


class CartCell: UITableViewCell {
    static let id = "CartCell"
  
    private var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.sizeToFit()
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "nome aqui"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .green
        label.showsExpansionTextWhenTruncated = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .black
        setupCoverImage()
        setupTitle()
    }
    
    private func setupTitle() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(coverImage.snp.trailing).offset(10)
            $0.top.equalToSuperview()
        }
    }
    
    private func setupCoverImage() {
        addSubview(coverImage)
        
        coverImage.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(50)
        }
    }
    
    func setCell(title: String, cover: String) {
        titleLabel.text = title.titleFormat()
        let url = URL(string: cover+".jpg")
        coverImage.kf.setImage(with: url)
      
    }
    
}

