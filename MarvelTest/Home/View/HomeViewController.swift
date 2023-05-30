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
        sb.searchBar.searchBarStyle = .prominent
        sb.searchBar.returnKeyType = .search
        sb.searchBar.enablesReturnKeyAutomatically = false
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
        searchBar.searchBar.delegate = self
        navigationItem.searchController = searchBar
        let button = UIButton(type: .custom)
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(filterTapped), for: .touchDown)
        button.frame = CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .green
    }
    
    @objc
    func filterTapped() {
        viewModel?.showFilterInput()
    }

}

extension HomeViewController: UISearchBarDelegate{

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        if searchBar.text != "" {
            viewModel?.clearData()
            viewModel?.getComicsByTitle(comicTitle: searchBar.text ?? "")
        }
        return true
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.navigateToComicDetail(index: indexPath.row)
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
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
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
