//
//  AppCoordinator.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 26.02.2024.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    var window: UIWindow? { get }
}

class AppCoordinator: AppCoordinatorProtocol {
    
    let window: UIWindow?
    var childCoordinator: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        PostScene()
    }
    
    func finish() {
        
    }
    
    private func PostScene() {
        let coordinator = MainScreenCoordinator(navigationController: navigationController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
