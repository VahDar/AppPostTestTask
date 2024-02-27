//
//  NetworkServiceKey.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

private struct NetworkServiceKey: InjectionKey {
    static var currentValue: NetworkServiceProtocol = NetworkService()
}

extension InjectedValue {
    var networkService: NetworkServiceProtocol {
        get { Self[NetworkServiceKey.self] }
        set { Self[NetworkServiceKey.self] = newValue }
    }
}
