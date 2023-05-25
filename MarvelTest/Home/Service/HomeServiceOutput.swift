//
//  HomeServiceOutput.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 23/05/23.
//

import Foundation
import Alamofire

protocol HomeServiceOutput: AnyObject {

    func succeess(comics: ComicDataWrapper)
    func failure(error: AFError)
    func succeessByYear(comics: ComicDataWrapper)
    func failureByYear(error: AFError)
   
}
