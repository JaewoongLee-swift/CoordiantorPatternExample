//
//  Coordinator.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/21.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    
    func start()
}
