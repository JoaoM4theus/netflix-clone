//
//  MainTabBarViewController.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 21/04/22.
//

import UIKit

enum MainTabBarController {
    case home
    case upcoming
    case search
    case download
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .upcoming:
            return UpcomingViewController()
        case .search:
            return SearchViewController()
        case .download:
            return DownloadViewController()
        }
    }
    
    var tabBarImage: String {
        switch self {
        case .home:
            return "house"
        case .upcoming:
            return "play.circle"
        case .search:
            return "magnifyingglass"
        case .download:
            return "arrow.down.to.line"
        }
    }
    
    var title: String {
        switch self {
            
        case .home:
            return "House"
        case .upcoming:
            return "Coming Soon"
        case .search:
            return "Top Search"
        case .download:
            return "Downloads"
        }
    }
}

class MainTabBarViewController: UITabBarController {
    var viewsTabBar: [MainTabBarController]
    
    init(viewsTabBar: [MainTabBarController] = [.home, .upcoming, .search, .download]) {
        self.viewsTabBar = viewsTabBar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        tabBar.tintColor = .label
        configureTabBar(views: viewsTabBar)
    }
    
    private func configureTabBar(views: [MainTabBarController]) {
        var viewControllers: [UINavigationController] = []
        views.forEach { view in
            let navigationController = UINavigationController(rootViewController: view.viewController)
            navigationController.tabBarItem.image = UIImage(systemName: view.tabBarImage)
            navigationController.title = view.title
            viewControllers.append(navigationController)
        }

        setViewControllers(viewControllers, animated: true)
    }
}

