//
//  MainTabBarViewController.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 21/04/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let upcoming = UINavigationController(rootViewController: UpcomingViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let download = UINavigationController(rootViewController: DownloadViewController())
        
        setViewControllers([home, upcoming, search, download], animated: true)
    }
}

