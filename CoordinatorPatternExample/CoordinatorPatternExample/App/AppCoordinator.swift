//
//  AppCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    private var navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        startStartCoordinator()
    }
}

extension AppCoordinator {
    private func startStartCoordinator() {
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        startCoordinator.start()
        
        childCoordinator.append(startCoordinator)
    }
}
