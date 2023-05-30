//
//  CartViewModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//


import Foundation
import UIKit

protocol CartViewModelDelegate: AnyObject {
    func setViewState(viewState: CartViewState)
    func reloadData()
}

public final class CartViewModel {
    var router: CartRouter?
    private weak var delegate: CartViewModelDelegate?

    init(router: CartRouter?, delegate: CartViewModelDelegate) {
        self.router = router
        self.delegate = delegate
        
    }
    
    func setState() {
        let state : CartViewState = getNumberOfItens() == 0 ? .empty : .filled
        delegate?.setViewState(viewState: state)
    }
    
    func getNumberOfItens() -> Int {
        CartManager.shared.numberOfItens()
    }
    
    func comicTitleForIndex(index: Int) -> String {
        CartManager.shared.itenTitleForIndex(index: index)
    }
    
    func comicCoverForIndex(index: Int) -> String {
        CartManager.shared.itenCoverForIndex(index: index)
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
    
}
