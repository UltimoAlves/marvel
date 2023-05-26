//
//  ComicDetailViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//
import UIKit


class ComicDetailViewController: UIViewController {
    
    private let mainView = ComicDetailView()
    var viewModel: ComicDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        CartManager.shared.cartCount()
    }
    
    @objc
    func getBuyAction() {
        viewModel?.buyAction()
    }
    
    @objc
    func getAddToCartAction() {
        viewModel?.addToCartAction()
    }
}

extension ComicDetailViewController: ComicDetailViewModelDelegate {
    func buyAction() {
        let alert = UIAlertController(title: "Success", message: "Thank you for your purchase", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    func fillContent(comic: ComicModel) {
        mainView.setValues(comic: comic, buyAction: #selector(getBuyAction),
                           cartAction: #selector(getAddToCartAction),
                           controller: self)
    }
    
}
