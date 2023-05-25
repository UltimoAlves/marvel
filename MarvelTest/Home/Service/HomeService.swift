//
//  HomeService.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 23/05/23.
//

import Foundation
import Alamofire

class HomeService {
    weak var output: HomeServiceOutput?
    
    func getComics(pageNumber: Int) {
        guard let hashKeyValue = ProcessInfo.processInfo.environment["MARVEL_HASH_KEY"] else { return }
        guard let publicKeyValue = ProcessInfo.processInfo.environment["MARVEL_PUBLIC_KEY"] else { return }
        let maxItensPage = 20
        
        
        let base = "https://gateway.marvel.com:443/v1/public/comics?"
        let limit = "limit=\(maxItensPage)"
        let offset = "&offset=\(pageNumber*maxItensPage)"
        let ts = "&ts=1"
        let publicKey = "&apikey=\(publicKeyValue)"
        let hashKey = "&hash=\(hashKeyValue)"
        var url = base+limit+offset+ts+publicKey+hashKey
        
        AF.request(url).responseDecodable(of: ComicDataWrapper.self) { response in
            switch response.result {
                case .success(let comics):
                self.output?.succeess(comics: comics)
                case .failure(let error):
                self.output?.failure(error: error)
            }
        }
    }
    
    func getComicsByYear(pageNumber: Int, year: Int) {
        guard let hashKeyValue = ProcessInfo.processInfo.environment["MARVEL_HASH_KEY"] else { return }
        guard let publicKeyValue = ProcessInfo.processInfo.environment["MARVEL_PUBLIC_KEY"] else { return }
        let maxItensPage = 20
        
        
        let base = "https://gateway.marvel.com:443/v1/public/comics?"
        let limit = "limit=\(maxItensPage)"
        let offset = "&offset=\(pageNumber*maxItensPage)"
        let ts = "&ts=1"
        let publicKey = "&apikey=\(publicKeyValue)"
        let hashKey = "&hash=\(hashKeyValue)"
        let startYear = "&startYear=\(year)"
        var url = base+limit+offset+startYear+ts+publicKey+hashKey
        
       
        AF.request(url).responseDecodable(of: ComicDataWrapper.self) { response in
            switch response.result {
                case .success(let comics):
                self.output?.succeessByYear(comics: comics)
                case .failure(let error):
                self.output?.failureByYear(error: error)
            }
        }
    }
    
}
