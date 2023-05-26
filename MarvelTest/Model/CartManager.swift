//
//  CartManager.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import Foundation

class CartManager {
    
    var comics: [ComicModel] = []
    
    static let shared = CartManager()
    
    func getCartContent() -> [ComicModel] {
        comics
    }
    
    func addToCart(comic: ComicModel) {
       comics.append(comic)
    }
    
    func cartCount() {
        print(comics.count)
    }
}
