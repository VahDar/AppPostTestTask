//
//  AppCoordinator.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 26.02.2024.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    var windowScene: UIWindow? { get }
}

class AppCoordinator: AppCoordinatorProtocol {
    
    var windowScene: UIWindow?
    var childCoordinator: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(windowScene: UIWindow?) {
        self.windowScene = windowScene
        self.navigationController = UINavigationController()
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
}
