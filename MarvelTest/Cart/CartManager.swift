//
//  CartManager.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import Foundation

class CartManager {
    
    private var comics: [ComicModel] = []
    
    static let shared = CartManager()
    
    func getIten(index: Int) -> ComicModel {
        comics[index]
    }
    
    func addToCart(comic: ComicModel) {
       comics.append(comic)
    }
    
    func numberOfItens() -> Int {
        comics.count
    }
    
    func itenTitleForIndex(index: Int) -> String {
        comics[index].title ?? ""
    }
    
    func itenCoverForIndex(index: Int) -> String {
        comics[index].thumbnail?.path ?? ""
    }
    
    func verifyIfExists(comicToVerify: ComicModel) -> Bool {
        for comic in comics {
            if comicToVerify.id == comic.id {
                return true
            }
        }
        return false 
    }
}
