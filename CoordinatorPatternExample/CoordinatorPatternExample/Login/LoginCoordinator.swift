//
//  LoginCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/30.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    weak var delegate: LoginCoordinatorDelegate?
    
    var childCoordinator: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func login() {
        delegate?.didLoggedIn(self)
    }
}
