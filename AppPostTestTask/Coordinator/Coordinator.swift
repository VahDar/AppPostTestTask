//
//  Coordinator.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 26.02.2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinator: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get }
    func start()
    func finish()
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
    func removeAllChildCoordinatorWith<T>(type: T.Type)
    func removeAllChildCiirdunatir()
}

extension Coordinator {
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter { $0 !== coordinator}
    }
    
    func removeAllChildCoordinatorWith<T>(type: T.Type) {
        childCoordinator = childCoordinator.filter { $0 is T == false }
    }
    
    func removeAllChildCiirdunatir() {
        childCoordinator.removeAll()
    }
    
}
