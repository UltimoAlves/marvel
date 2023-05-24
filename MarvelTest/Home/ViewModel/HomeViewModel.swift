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
}

public final class HomeViewModel {
    private weak var router: HomeRouter?
    private var service: HomeService
    private var comics: [ComicModel] = []
    private weak var delegate: HomeViewModelDelegate?
    
    init(router: HomeRouter!, service: HomeService, delegate: HomeViewModelDelegate) {
        self.router = router
        self.service = service
        self.delegate = delegate
        self.service.output = self
    }
    
    func fetchFilms() {
        service.getComics()
     }
    
    func comicsCount() -> Int {
        comics.count
    }
    
    func comicTitleForIndex(index: Int) -> String {
        comics[index].title ?? ""
    }
    
}

extension HomeViewModel: HomeServiceOutput {
    func succeess(comics: ComicDataWrapper) {
        self.comics = comics.data?.results ?? []
        delegate?.reloadContent()
        
    }
    
    func failure(error: AFError) {
        print(error)
    }
}
