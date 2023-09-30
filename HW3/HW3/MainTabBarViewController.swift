//
//  ViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class MainTabBarViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = SearchViewController()
        let vc3 = UpcomingViewController()
        let vc4 = DownloadsViewController()
        let vc5 = MoreViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        vc5.tabBarItem.image = UIImage(systemName: "line.3.horizontal")
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Coming Soon"
        vc4.title = "Downloads"
        vc5.title = "More"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3, vc4,vc5], animated:true)
        //dark mode/ light mode - command + shift + A
        
    }


}

