//
//  Coordinator.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 26.02.2024.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinator: [Coordinator] { get set }
}
