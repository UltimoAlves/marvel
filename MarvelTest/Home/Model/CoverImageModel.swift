//
//  CoverImageModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 23/05/23.
//

import Foundation

struct CoverImageModel {
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case url
    }
}

extension CoverImageModel: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        
    }
}

extension CoverImageModel: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(url, forKey: .url)
       
    }
}
