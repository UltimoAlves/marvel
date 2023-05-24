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
    
    func getComics() {
        guard let hashKey = ProcessInfo.processInfo.environment["MARVEL_HASH_KEY"] else { return }
        guard let publicKey = ProcessInfo.processInfo.environment["MARVEL_PUBLIC_KEY"] else { return }
        
        AF.request("https://gateway.marvel.com:443/v1/public/comics?limit=100&ts=1&apikey=\(publicKey)&hash=\(hashKey)").responseDecodable(of: ComicDataWrapper.self) { response in
            switch response.result {
                case .success(let comics):
                self.output?.succeess(comics: comics)
                case .failure(let error):
                self.output?.failure(error: error)
            }
        }
    }
    
}
