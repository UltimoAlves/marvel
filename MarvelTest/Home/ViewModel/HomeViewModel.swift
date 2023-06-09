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
    func showFilterInput()
}

public final class HomeViewModel {
    var router: HomeRouter?
    private var service: HomeService
    private var comics: [ComicModel] = []
    private weak var delegate: HomeViewModelDelegate?
    private var pageNumber = 0
    private var yearToFilter = 0
    private var titleToFilter = ""
    
    init(router: HomeRouter, service: HomeService, delegate: HomeViewModelDelegate) {
        self.router = router
        self.service = service
        self.delegate = delegate
        self.service.output = self
    }
    
    func getComics() {
        delegate?.showSpinner()
        service.getComics(pageNumber: pageNumber)
        pageNumber += 1
     }
    
    func getMoreComics() {
        delegate?.showSpinner()
        if yearToFilter == 0 && titleToFilter == "" {
            service.getComics(pageNumber: pageNumber)
        } else if yearToFilter != 0 && titleToFilter == "" {
            service.getComicsByYear(pageNumber: pageNumber, year: yearToFilter)
        } else if titleToFilter != "" {
            service.getComicsByTitle(comicTitle: titleToFilter, pageNumber: pageNumber, year: yearToFilter)
        }
        
        pageNumber += 1
    }
    
    func getComicsByYear(year: Int) {
        delegate?.showSpinner()
        yearToFilter = year
        service.getComicsByYear(pageNumber: pageNumber, year: yearToFilter)
        pageNumber += 1
    }
    
    func getComicsByTitle(comicTitle: String) {
        delegate?.showSpinner()
        titleToFilter = comicTitle
        service.getComicsByTitle(comicTitle: titleToFilter, pageNumber: pageNumber, year: yearToFilter)
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
    
    func showFilterInput() {
        delegate?.showFilterInput()
    }
    
    func clearData() {
        comics.removeAll()
        pageNumber = 0
        delegate?.reloadContent()
    }
    
    func navigateToComicDetail(index: Int) {
        router?.routeToDetail(comic: comics[index])
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
    
    func succeessByYear(comics: ComicDataWrapper) {
        self.comics.append(contentsOf: comics.data?.results ?? [])
        delegate?.reloadContent()
        delegate?.hideSpinner()
    }
    
    func failureByYear(error: AFError) {
        print(error)
    }
}

