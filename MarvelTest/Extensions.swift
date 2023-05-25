//
//  Extensions.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import UIKit
import CryptoKit

fileprivate var shadowView: UIView?

extension UIViewController {
    
    func showSpinnerView() {
        shadowView = UIView(frame: view.bounds)
        shadowView?.backgroundColor = .gray.withAlphaComponent(0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.startAnimating()
        view.addSubview(shadowView!)
        
        shadowView?.addSubview(activityIndicator)
        
        shadowView?.center = view.center
        activityIndicator.center = shadowView!.center
    }
    
    func removeSpinnerView() {
        shadowView?.removeFromSuperview()
    }
}

extension String {
var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
