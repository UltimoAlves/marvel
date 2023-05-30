//
//  CartViewController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import UIKit


class CartViewController: UIViewController {
    
    private let mainView = CartView()
    var viewModel: CartViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.setState()
        viewModel?.reloadData()
    }
    
    func initialSetup() {
        view = mainView
        mainView.addTableviewDelegateDataSource(delegate: self, dataSource: self)
        viewModel?.setState()
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfItens() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.id, for: indexPath as IndexPath) as? CartCell {
            cell.setCell(title: viewModel?.comicTitleForIndex(index: indexPath.row) ?? "",
                         cover: viewModel?.comicCoverForIndex(index: indexPath.row) ?? "")
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension CartViewController: CartViewModelDelegate {
    func reloadData() {
        mainView.reloadData()
    }
    
    func setViewState(viewState: CartViewState) {
        mainView.setState(state: viewState)
    }
}
