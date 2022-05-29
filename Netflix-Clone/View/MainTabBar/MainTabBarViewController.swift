//
//  MainTabBarViewController.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 21/04/22.
//

import UIKit

enum ItemsTabBarController {
    case home(UIViewController, String, String)
    case upcoming(UIViewController, String, String)
    case search(UIViewController, String, String)
    case download(UIViewController, String, String)
    
    var itemTabBar: (viewController: UIViewController,
                     imageName: String,
                     title: String) {
        switch self {
        case .home(let viewController, let imageName, let title):
            return (viewController, imageName, title)
        case .upcoming(let viewController, let imageName, let title):
            return (viewController, imageName, title)
        case .search(let viewController, let imageName, let title):
            return (viewController, imageName, title)
        case .download(let viewController, let imageName, let title):
            return (viewController, imageName, title)
        }
    }
}

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        tabBar.tintColor = .label
        configureDefaultTabBar()
    }
    
    private func configureDefaultTabBar(_ views: [ItemsTabBarController] = [
        .home(HomeViewController(), "house", "House"),
        .upcoming(UpcomingViewController(), "play.circle", "Coming Soon"),
        .search(SearchViewController(), "magnifyingglass", "Top Search"),
        .download(DownloadViewController(), "arrow.down.to.line", "Downloads")
    ]) {
        var viewControllers: [UINavigationController] = []
        views.forEach { view in
            let navigationController = UINavigationController(rootViewController: view.itemTabBar.viewController)
            navigationController.tabBarItem.image = UIImage(systemName: view.itemTabBar.imageName)
            navigationController.title = view.itemTabBar.title
            viewControllers.append(navigationController)
        }
        
        setViewControllers(viewControllers, animated: true)
    }
}

