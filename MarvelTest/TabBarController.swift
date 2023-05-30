//
//  TabBarController.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 30/05/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVc = UINavigationController(rootViewController: HomeModule().createModule())
        homeVc.title = "Home"
        
        let cartVc = CartModule().createModule()
        cartVc.title = "Cart"
        
        setViewControllers([homeVc, cartVc], animated: true)
        
        tabBar.items?[0].image = UIImage(systemName: "house")
        tabBar.items?[1].image = UIImage(systemName: "cart")
        
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .lightText
        tabBar.tintColor = .green
    }
    
    
}
