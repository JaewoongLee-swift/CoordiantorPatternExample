//
//  StartCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/27.
//

import UIKit

class StartCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = StartViewController()
        startViewController.delegate = self
        navigationController.pushViewController(startViewController, animated: true)
    }
}

extension StartCoordinator: StartViewControllerDelegate {
    func startApp() {
        startLoginCoordinator()
    }
}

extension StartCoordinator {
    private func startLoginCoordinator() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        
        loginCoordinator.delegate = self
        loginCoordinator.start()
        
        childCoordinator.append(loginCoordinator)
    }
    
    private func startMainCoordinator() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
        
        childCoordinator.append(mainCoordinator)
    }
}

extension StartCoordinator: LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        self.childCoordinator = self.childCoordinator.filter { $0 !== coordinator }
        navigationController.popViewController(animated: true)
        
        startMainCoordinator()
    }
}
