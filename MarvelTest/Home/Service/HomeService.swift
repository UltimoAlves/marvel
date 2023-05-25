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
        guard let hashKey = ProcessInfo.processInfo.environment["MARVEL_HASH_KEY"] else { return }
        guard let publicKey = ProcessInfo.processInfo.environment["MARVEL_PUBLIC_KEY"] else { return }
        let limit = 20
        let offset = pageNumber*limit

        AF.request("https://gateway.marvel.com:443/v1/public/comics?limit=\(limit)&offset=\(offset)&ts=1&apikey=\(publicKey)&hash=\(hashKey)").responseDecodable(of: ComicDataWrapper.self) { response in
            switch response.result {
                case .success(let comics):
                self.output?.succeess(comics: comics)
                case .failure(let error):
                self.output?.failure(error: error)
            }
        }
    }
    
}
