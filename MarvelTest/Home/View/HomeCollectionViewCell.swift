//
//  HomeCollectionViewCell.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import UIKit
import SnapKit
class HomeCollectionViewCell: UICollectionViewCell {
    static let id = "HomeCell"
    private var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "house")
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "nome aqui"
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
        setupTitle()
        setupImage()
        
    }
    
    func setupTitle() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
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
    
    func setCell(title: String, cover: UIImage) {
        titleLabel.text = title
        coverImage.image = cover
    }
    
}
