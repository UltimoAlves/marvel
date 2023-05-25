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
        initialSetup()
        setupNavigation()
    }
    
    func initialSetup(){
        view = mainView
        mainView.addCollectionviewDelegateDataSource(delegate: self, dataSource: self)
        viewModel?.getComics()
        mainView.showSpinner()
    }
    
    func setupNavigation() {
        navigationItem.title = "Movie Search"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        let button = UIButton(type: .custom)
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.addTarget(self, action: #selector(filterTapped), for: .touchDown)
        button.frame = CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    @objc
    func filterTapped() {
        viewModel?.showFilterInput()
    }

}

extension HomeViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else{ return }
      
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.comicsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.id, for: indexPath) as? HomeCollectionViewCell{
            cell.backgroundColor = .systemBackground
            cell.setCell(title: viewModel?.comicTitleForIndex(index: indexPath.row) ?? "",
                            cover: viewModel?.comicCoverForIndex(index: indexPath.row) ?? "")
            return cell
        }
        return UICollectionViewCell()
           
    }

    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if offsetY > height - scrollView.frame.size.height {
            viewModel?.getMoreComics()
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func showSpinner() {
        mainView.showSpinner()
    }
    
    func hideSpinner() {
        mainView.hideSpinner()
    }
    
    func reloadContent() {
        mainView.reloadData()
    }
    
    func showFilterInput() {
        var year = UITextField()

        let alert = UIAlertController(title: "Enter the year you want to filter", message: "", preferredStyle: .alert)
        
        let createAction = UIAlertAction(title: "Search", style: .default) { [self] (action) in
            guard let year = Int(year.text ?? "0") else { return }
            viewModel?.getComicsByYear(year: year)
            viewModel?.clearData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Year"
            alertTextField.keyboardType = .numberPad
            year = alertTextField
        }
         
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
