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
    }
    
    func initialSetup(){
        view = mainView
        navigationItem.title  = "Movie Search"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        mainView.addCollectionviewDelegateDataSource(delegate: self, dataSource: self)
        viewModel?.fetchFilms()
        mainView.showSpinner()
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
            viewModel?.fetchFilms()
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
}
