//
//  MainTabBarController.swift
//  MusicBox
//
//  Created by Artem Tkachev on 3.04.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            generateVC(rootViewController: SearchMusicViewController(), image: UIImage(systemName: "magnifyingglass"), title: "Search"),
            generateVC(rootViewController: ViewController(), image: UIImage(systemName: "music.note.list"), title: "Library")
        ]
    }
    
    func generateVC(rootViewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        rootViewController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
