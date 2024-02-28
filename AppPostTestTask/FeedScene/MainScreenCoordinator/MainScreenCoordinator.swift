//
//  MainScreenCoordinator.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import Foundation
import UIKit

final class MainScreenCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        <#code#>
    }
    
    func finish() {
        <#code#>
    }
    
    
}
