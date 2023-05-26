//
//  ComicDetailViewModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//

import Foundation


import Foundation
import Alamofire
import UIKit

protocol ComicDetailViewModelDelegate: AnyObject {
    func fillContent(comic: ComicModel)
    func buyAction()
}

public final class ComicDetailViewModel {
    var router: ComicDetailRouter?
    private var comic: ComicModel
    private weak var delegate: ComicDetailViewModelDelegate?

    init(router: ComicDetailRouter?, comic: ComicModel, delegate: ComicDetailViewModelDelegate) {
        self.router = router
        self.comic = comic
        self.delegate = delegate
        
        delegate.fillContent(comic: comic)
    }
    
    func buyAction() {
        delegate?.buyAction()
    }
    
    func addToCartAction() {
        CartManager.shared.addToCart(comic: comic)
    }
}
