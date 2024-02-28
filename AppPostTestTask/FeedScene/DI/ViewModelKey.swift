//
//  ViewModelKey.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import Foundation

private struct ViewModelKey: InjectionKey {
    
    static var currentValue: ViewModelProtocol = ViewModel()
}

extension InjectedValue {
    var viewModel: ViewModelProtocol {
        get { Self[ViewModelKey.self] }
        set { Self[ViewModelKey.self] = newValue }
    }
}
