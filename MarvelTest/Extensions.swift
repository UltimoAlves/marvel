//
//  Extensions.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 08/05/23.
//

import Foundation
import UIKit

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
