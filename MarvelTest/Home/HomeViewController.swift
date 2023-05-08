//
//  HomeViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let mainView = HomeView()
    var viewModel: HomeViewModel?
    
    private var searchBar: UISearchController = {
        let sb = UISearchController()
        sb.searchBar.placeholder = "Enter the movie name"
        sb.searchBar.searchBarStyle = .minimal
        return sb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        navigationItem.title  = "Movie Search"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
    }

}

extension HomeViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else{ return }
      
    }
}
