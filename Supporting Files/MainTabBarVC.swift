//
//  MainTabBarVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/02/24.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
        addNavigationController()
    }
    
    func addNavigationController(){
        let vc1 = UINavigationController(rootViewController: LibraryVC())
        let vc2 = UINavigationController(rootViewController: MyBookVC())
        let vc3 = UINavigationController(rootViewController: MyProfileVC())
        
        vc1.tabBarItem.image = UIImage(named: "Allbooks")
        vc2.tabBarItem.image = UIImage(named: "Mybooks")
        vc3.tabBarItem.image = UIImage(named: "Profile")
        
        vc1.title = "Библиотека"
        vc2.title = "Мои книги"
        vc3.title = "Профиль"
        
        
        
        
        tabBar.tintColor = UIColor(hex: 0xFFD2C9, alpha: 1)
        tabBar.barTintColor = .black
        
        
        setViewControllers([vc1, vc2, vc3], animated: true )

    }

}
