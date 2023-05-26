//
//  ComicDetailViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 25/05/23.
//
import UIKit


class ComicDetailViewController: UIViewController {
    
    private let mainView = ComicDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }
    
    
}
