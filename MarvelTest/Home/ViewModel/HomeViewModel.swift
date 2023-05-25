//
//  HomeViewModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import Alamofire

protocol HomeViewModelDelegate: AnyObject {
    func reloadContent()
    func showSpinner()
    func hideSpinner()
}

public final class HomeViewModel {
    private weak var router: HomeRouter?
    private var service: HomeService
    private var comics: [ComicModel] = []
    private weak var delegate: HomeViewModelDelegate?
    private var pageNumber = 0
    init(router: HomeRouter!, service: HomeService, delegate: HomeViewModelDelegate) {
        self.router = router
        self.service = service
        self.delegate = delegate
        self.service.output = self
    }
    
    func fetchFilms() {
        delegate?.showSpinner()
        
        service.getComics(pageNumber: pageNumber)
        pageNumber += 1
     }
    
    func showSpinner() {
        delegate?.showSpinner()
    }
    
    func hideSpinner() {
        delegate?.hideSpinner()
    }
    
    func comicsCount() -> Int {
        comics.count
    }
    
    func comicTitleForIndex(index: Int) -> String {
        comics[index].title ?? ""
    }
    
    func comicCoverForIndex(index: Int) -> String {
        comics[index].thumbnail?.path ?? ""
    }
    
}

extension HomeViewModel: HomeServiceOutput {
    func succeess(comics: ComicDataWrapper) {
        self.comics.append(contentsOf: comics.data?.results ?? [])  
        delegate?.reloadContent()
        delegate?.hideSpinner()
        
    }
    
    func failure(error: AFError) {
        print(error)
    }
}

