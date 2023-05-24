//
//  String+extension.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 24/05/23.
//

import Foundation

extension String {
    func titleFormat() -> String{
        var str = self

        if let range = str.range(of: "#") {
          str.removeSubrange(range.lowerBound..<str.endIndex)
        }
        
        return str
    }
}
