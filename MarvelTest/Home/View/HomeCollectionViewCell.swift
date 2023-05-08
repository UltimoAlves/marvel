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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .cyan
        
    }
    
    private func setupSearchBar() {
        addSubview(coverImage)
        
        coverImage.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
}
