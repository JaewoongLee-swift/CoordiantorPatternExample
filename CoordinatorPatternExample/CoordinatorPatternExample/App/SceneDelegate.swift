//
//  SceneDelegate.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        guard let window else { return }
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        
        appCoordinator.start()
    }
}

