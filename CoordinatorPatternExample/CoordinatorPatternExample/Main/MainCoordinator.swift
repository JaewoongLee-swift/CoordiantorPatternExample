//
//  MainCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/30.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        
        navigationController.pushViewController(mainViewController, animated: true)
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func profileEdit() {
        startLoginCoordinator()
    }
}

extension MainCoordinator {
    private func startLoginCoordinator() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
        
        childCoordinator.append(loginCoordinator)
    }
}
