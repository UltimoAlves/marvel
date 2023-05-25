//
//  CollectionViewFooter.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//

import Foundation
import UIKit
import SnapKit

public class CollectionViewFooter: UICollectionReusableView {
    
    var footerView = UIActivityIndicatorView(style: .medium)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(footerView)
        footerView.color = .systemPink
        footerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
