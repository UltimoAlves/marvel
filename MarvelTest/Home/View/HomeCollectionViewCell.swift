//
//  HomeCollectionViewCell.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import UIKit
import SnapKit
import Kingfisher
class HomeCollectionViewCell: UICollectionViewCell {
    static let id = "HomeCell"
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
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .green
        label.backgroundColor = .black
        label.showsExpansionTextWhenTruncated = false
        return label
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
        setupImage()
        
    }
    
    private func setupTitle() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    private func setupImage() {
        addSubview(coverImage)
        
        coverImage.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.top)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    func setCell(title: String, cover: String) {
        titleLabel.text = title.titleFormat()
        let url = URL(string: cover+".jpg")
        coverImage.kf.setImage(with: url)
      
    }
    
}

