//
//  ComicModel.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 23/05/23.
//

import Foundation


struct ComicModel {
    let title: String?
    let thumbnail: CoverImageModel?
    let id: Int?
   
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case id
    }
}

extension ComicModel: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.thumbnail = try container.decodeIfPresent(CoverImageModel.self, forKey: .thumbnail)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        
    }
}

extension ComicModel: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(id, forKey: .id)
       
    }
}
