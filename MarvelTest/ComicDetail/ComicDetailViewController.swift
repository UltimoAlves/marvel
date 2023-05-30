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
      
    }
    
    @objc
    func getAddToCartAction() {
        viewModel?.verifyIfAlreadyInCart()
    }
}

extension ComicDetailViewController: ComicDetailViewModelDelegate {
    func showAlertAddAgain() {
        let alert = UIAlertController(title: "Attention", message: "The comic is already in your cart. Do you want to add again?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.viewModel?.addToCartAction()
        }
        let noAction = UIAlertAction(title: "No", style: .destructive)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    
    func addCartDone() {
        let alert = UIAlertController(title: "Success", message: "The comic has been successfully added!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    func fillContent(comic: ComicModel) {
        mainView.setValues(comic: comic,
                           cartAction: #selector(getAddToCartAction),
                           controller: self)
    }
    
}
