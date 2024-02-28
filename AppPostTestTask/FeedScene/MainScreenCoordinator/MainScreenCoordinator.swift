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
    @Injected(\.viewModel) var viewModel
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func finish() {
        <#code#>
    }
    
    
}
