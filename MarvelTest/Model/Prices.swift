//
//  Prices.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 26/05/23.
//

import Foundation

struct PriceModel {
    let type: String?
    let value: Float?
   
    
    enum CodingKeys: String, CodingKey {
        case type
        case price
    }
    
    func printPrice() -> Float? {
        if type == "printPrice" {
            return value
        }
        return nil
    }
    
    func digitalPrice() -> Float? {
        if type == "digitalPurchasePrice" {
            return value
        }
        return nil
    }
}

extension PriceModel: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.value = try container.decodeIfPresent(Float.self, forKey: .price)
      
        
    }
}

extension PriceModel: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(value, forKey: .price)
       
       
    }
}
